#require './tk'
#require './fileutils'

fr0 = TkFrame.new.pack('side' => 'top', 'fill' => 'x')
fr1 = TkLabelframe.new(
                       text: "decided filename",
                       labelanchor: 'nw',
                       relief: 'sunken'
                       ).pack('side' => 'top', 'fill' => 'x')
frx = TkLabelframe.new(
                       text: "use student number",
                       labelanchor: 'nw',
                       relief: 'sunken'
                       ).pack('side' => 'top', 'fill' => 'x')
fr3 = TkFrame.new(frx).pack('side' => 'top', 'fill' => 'x')
fr4 = TkFrame.new(frx).pack('side' => 'top', 'fill' => 'x')

scr = TkScrollbar.new.pack('fill'=>'y', 'side'=>'right')


fr5 = TkFrame.new.pack('side'=>'bottom')
coun = TkLabel.new(nil, text: '0/255').pack('side'=>'bottom')

text = TkListbox.new(nil,
                  width: 50,
                  height: 20,
                  ).pack('side'=>'bottom')


text.yscrollbar( scr )

TkLabel.new(fr0, 'text'=>'Graduate').pack('side'=>'left')
sp = TkSpinbox.new(fr0,
                   from: 21,
                   to: 50,
                   increment: 1,
                   width: 3,
                   state: 'readonly'
                   ).pack('side' => 'left')

TkLabel.new(fr1, 'text'=>'Filename').pack('side'=>'left')
fname = TkEntry.new(fr1, 'width'=>14).pack('side'=>'left')
id = TkVariable.new
onfile = TkVariable.new
subid = TkVariable.new
te = TkVariable.new("s12x0xxx")


TkRadioButton.new(fr3,
            text:  "with s ",
            value: "s12x0xxx",
            variable: te
            ).pack('side' => 'left')

TkRadioButton.new(fr4,
            text:  "without s ",
            value: "12x0xxx",
            variable: te
            ).pack('side' => 'left')

af = TkEntry.new(fr3, 'width'=>5).pack('side'=>'right')
TkLabel.new(fr3, textvariable: te).pack('side'=>'right')
be = TkEntry.new(fr3, 'width'=>5).pack('side'=>'right')
TkLabel.new(fr3, 'text'=>'Filename').pack('side'=>'right')

TkButton.new(fr1,
             text: 'search!',
             command: proc{
               text.clear()
               id.value = "1#{sp.get}0000"
               Thread.new{
                 for i in (1..250)
                   begin
                     id.value = "#{id}".to_i + 1
                     coun.text = "#{i}/250"

                     Dir.chdir("/home/student/s#{id}")
                     onfile = Dir.glob("**/#{fname.value}")
                   rescue
                     next
                   end
                   if onfile.empty?
                     next
                   end
                   for var in onfile
                     text.insert('end',"s#{id}/#{var}")
                   end
                   next
                 end
                 coun.text = '0/255'
               }
             }).pack('side'=>'left')

TkButton.new(fr4,
             text: 'search!',
             command: proc{
               text.clear()
               if te == "s12x0xxx"
                 subid = "s"
               else
                 subid = ""
               end

               id.value = "1#{sp.get}0000"
               Thread.new{
                 for i in (1..250)
                   begin
                     id.value = "#{id}".to_i + 1
                     coun.text = "#{i}/250"
                     fname.value = "#{be.value}#{subid}#{id}#{af.value}"
                     Dir.chdir("/home/student/s#{id}")
                     onfile = Dir.glob("**/#{fname.value}")
                   rescue
                     next
                   end
                   if onfile.empty?
                     next
                   end
                   for var in onfile
                     text.insert('end',"s#{id}/#{var}")
                   end
                   next
                 end
               }
             }).pack('side'=>'right')

copycount = 0 #copyID

text.bind '<ListboxSelect>', proc { #click list
begin

  fi =  text.get(text.curselection)
  home =  File.expand_path("~")
  bname = File::basename("#{fi}")
  newwindow = TkToplevel.new(
                             title: bname,
                             resizable: [1,0]
                             )

  cattext = TkText.new(newwindow,
                       width: 40,
                       height: 40,).pack('fill' => 'both')
  spath = "/home/student/#{fi}"

  if File::ftype("#{spath}") == 'directory' #directory
    Dir.chdir("#{spath}")
    ls = Dir.glob("*")
    cattext.insert('end',"List of files in Directory\n\n")
    for var in ls
      ans = File::ftype("#{spath}/#{var}")
      cattext.insert('end',"#{var}  ( #{ans}) \n")
    end
    cattext.state = 'disabled'
    TkButton.new(newwindow,
                 text: 'Copy to Desktop',
                 command: proc{
                   begin
                     FileUtils.cp_r("#{spath}/","#{home}/Desktop/")
                     File::rename("#{home}/Desktop/#{bname}","#{home}/Desktop/#{bname}_#{copycount}")
                     copycount += 1
                     newwindow.destroy
                   rescue
                     Tk.messageBox(
                                   title: 'error',
                                   message: 'one more push copy button! or Already exist')
                     copycount += 7
                   end
                 }).pack('side'=>'bottom')

  else

    copybutton = TkButton.new(newwindow,
                              text: 'Copy to Desktop').pack('side'=>'bottom')

    source = open("#{spath}")
    str = source.read
    source.close

    cattext.insert('end',str)
    cattext.state = 'disabled'

    copybutton.command = proc{
      begin
        FileUtils.cp("#{spath}","#{home}/Desktop/")
        File::rename("#{home}/Desktop/#{bname}","#{home}/Desktop/#{bname}_#{copycount}")
        copycount += 1
        newwindow.destroy
      rescue
        Tk.messageBox(
                      title: 'error',
                      message: 'one more push copy button!\n or Already exist')
        copycount += 4
      end
    }
  end
rescue
end
}

Tk.mainloop
