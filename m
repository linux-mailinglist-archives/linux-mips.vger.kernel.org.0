Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6DC15135B
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2020 00:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgBCXiy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 18:38:54 -0500
Received: from rcdn-iport-6.cisco.com ([173.37.86.77]:3822 "EHLO
        rcdn-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgBCXiy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Feb 2020 18:38:54 -0500
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Feb 2020 18:38:53 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=22453; q=dns/txt;
  s=iport; t=1580773133; x=1581982733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K2Vao2PmHa2Sqp5WEe14JXoXeBNjSFxoNRbDXiHlpNM=;
  b=codaWgdyYn7O32BLqVsg21MfV5mdsrMHBkr0xdZrZaQwpYlyXEC0WKE3
   a8abdvFRj9kAcWFSBSfrLP4NHlvCGfPNhlCfwqPullCfKlhGflX/ekpNH
   242H2e8lRUSNKGYL2VCOPE2TDqbto0iqII4DjKmgYSbdE+okawD53ehI4
   U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AIAwCfrDhe/4oNJK1lHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCKWxUATIqljWOR4twCQEBAQwBASUKAQGEQII2JDgTAgMNAQE?=
 =?us-ascii?q?EAQEBAgEFBG2FNwyGHwFGgVGDJgGCew+sHoInhDUBhh+BOIdChF4aggCBEYJ?=
 =?us-ascii?q?ec4JkBIFBAQGGDgSNOhIICoh4gSh7hzOPNoJFgk6EeIVHiScMG4JIeIcWkDK?=
 =?us-ascii?q?XSJIzAgQGBQIVgWkigVhNIxU7gmwJRxgNjikXiGSBXYQDIAMwAgGMVIIyAQE?=
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; 
   d="scan'208";a="716814896"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Feb 2020 23:31:48 +0000
Received: from kamensky-p53s.cisco.com ([10.24.32.118])
        (authenticated bits=0)
        by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 013NVas6021219
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 3 Feb 2020 23:31:48 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH 0/2] mips: vdso: fix 'jalr t9' crash in vdso code
Date:   Mon,  3 Feb 2020 15:31:31 -0800
Message-Id: <20200203233133.38613-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.32.118, [10.24.32.118]
X-Outbound-Node: alln-core-5.cisco.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Folks,

Bruce Ashfield reported in [1] sysvinit crash on MIPS qemu machine
in vdso. I've investigated the issue and it turns out that crash
happens because linker while creating vdso shared object failed to
convert 'jalr t9' instructions from .o into PC relative 'bal' call
in .so. And as result since nobody sets GOT table in vdso case code
crashes while 'jalr t9' instruction reached.

Two patches to address the issue follow this cover letter.

The first explicitly specifies required for 'jalr t9' to 'bal'
conversion gcc compilation options in vdso Makefile. I.e now
Makefile does not rely on implicit defaults in MIPS toolchain
needed for conversion to occur, whether they are on or off by
default.

The second adds build time check that verifies that in MIPS vdso
does not contain 'jalr t9' calls.

Please find below my debugging notes that give more details and
walk through my investigation.

[1] https://lore.kernel.org/linux-mips/CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com/

Thanks,
Victor

Debugging MIPS vdso crash on 'jalr t9' instructions
===================================================

Executive Summary
=================

MIPS n32 user land code running on 5.4 64bit kernel compiled by
gcc toolchain that configured for n32 crashes in vdso vgettimeofday
hitting 'jalr $t9' instructions since nobody sets GOT table in vdso
case. MIPS 64 user land works OK in the same situation because
of glibc bug (different issue) in this case gettimeofday does not
use vdso and it goes through regular system call.

Also it was observed that in case if toolchain is configured for
o32 -mabi=32 the same vdso .so do not have 'jalr $t9' instructions.
Instead they are replaced by PC relative 'bal' call. The difference
boils down to what default gcc options get in different toolchain
configuration. Specifically in order for binutils ld to convert
'jalr $t9' to static function to PC relative 'bal' calls the following
gcc MIPS options must be on: '-mrelax-pic-calls -mexplicit-relocs',
which happens to be off in case of mips64-poky-linux-gnun32-gcc
mips64-poky-linux-gcc Yocto poky toolchains. Explicitely calling
out these option in vdso Makefile fixes the issue.

Initial Problem Report
======================

It was reported that Yocto image with new 5.4 kernel on qemumips64
machine crashes in sysvinit process:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c

Crash happens only if 64bit MIPS kernel runs n32 user land
----------------------------------------------------------

By looking at test configuration

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/stdio

it seems that when 5.4 64bit kernel runs 64bit (-mabi=64) user land
it works ok. But only in multilib case when 64bit kernel runs n32
user land sysvinit crashes.

Reproduce sysvinit init n32 mode under gdb
==========================================

Bring n32 libraries and n32 sysvinit binaries into 64bit user land
image allowed to reproduce crash under gdb.

(gdb) set args --init 3
(gdb) set follow-fork-mode child
(gdb) run
Starting program: /home/root/sysvinit/sbin/init.sysvinit --init 3
[Attaching after process 273 fork to child process 276]
[New inferior 2 (process 276)]
[Detaching after fork from parent process 273]
[Inferior 1 (process 273) detached]
[Attaching after process 276 fork to child process 277]
[New inferior 3 (process 277)]
[Detaching after fork from parent process 276]
[Inferior 2 (process 276) detached]

Thread 3.1 "init.sysvinit" received signal SIGSEGV, Segmentation fault.
[Switching to process 277]
0x000002d0 in ?? ()
(gdb) bt
#0  0x000002d0 in ?? ()
#1  0x7fff6830 in __vdso_clock_gettime64 ()
#2  0x77ed4064 in __GI___clock_gettime64 (clock_id=0, tp=0x7fff2040) at ../sysdeps/unix/sysv/linux/clock_gettime.c:52
#3  0x77ed41bc in __GI___clock_gettime (clock_id=<optimized out>, tp=0x7fff2070) at ../sysdeps/unix/sysv/linux/clock_gettime.c:82
#4  0x77ec7934 in ___gettimeofday (tv=0x7fff20b0, tz=<optimized out>) at ../time/gettimeofday.c:32
#5  0x55558898 in write_utmp (user=0x555595e8 "", id=0x5556d404 "si", pid=277, type=5, line=0x555595e8 "", oldline=0x7fff2428 "") at utmp.c:211
#6  0x55558c80 in write_utmp_wtmp (user=0x555595e8 "", id=0x5556d404 "si", pid=277, type=5, line=0x555595e8 "") at utmp.c:265
#7  0x55555fd4 in spawn (ch=0x5556d3f0, res=<optimized out>) at init.c:1277
#8  0x555562fc in startup (ch=0x5556d3f0) at init.c:1348
#9  start_if_needed () at init.c:1842
#10 0x55557b00 in init_main () at init.c:2861
#11 0x55552328 in main (argc=3, argv=0x7fff2d34) at init.c:3124

It seems we have a problem with gettimeofday VDSO. Why
64bit user land does not have the same issue. Continue
investigation on simple test that just calls gettimeofday.

N64 abi gettimeofday goes through syscall
=========================================

Backtrace of n64 gettimeofday
-----------------------------

(gdb) bt
#0  0x000000fff7ecf6c8 in __GI___clock_gettime (clock_id=0, tp=0xffffffab00)
    at ../sysdeps/unix/sysv/linux/clock_gettime.c:40
#1  0x000000fff7ec2d84 in ___gettimeofday (tv=0xffffffab30, tz=<optimized out>)
    at ../time/gettimeofday.c:32
#2  0x000000aaaaaaab38 in main () at gettimeofday.c:7
(gdb) x /1i $pc
=> 0xfff7ecf6c8 <__GI___clock_gettime+24>:	syscall

I.e in case of 64 bit MIPS user land gettimeofday does not
go through vsyscall but rather regular syscall.

Let's look why.

Source code of glibc clock_gettime
----------------------------------

From 'cat -n sysdeps/unix/sysv/linux/clock_gettime.c'

    30	__clock_gettime64 (clockid_t clock_id, struct __timespec64 *tp)
    31	{
    32	#ifdef __ASSUME_TIME64_SYSCALLS
    33	  /* 64 bit ABIs or newer 32-bit ABIs that only support 64-bit time_t.  */
    34	# ifndef __NR_clock_gettime64
    35	#  define __NR_clock_gettime64 __NR_clock_gettime
    36	# endif
    37	# ifdef HAVE_CLOCK_GETTIME64_VSYSCALL
    38	  return INLINE_VSYSCALL (clock_gettime64, 2, clock_id, tp);
    39	# else
    40	  return INLINE_SYSCALL_CALL (clock_gettime64, clock_id, tp);
    41	# endif
    42	#else
    43	  int r;
    44	  /* Old 32-bit ABI with possible 64-bit time_t support.  */
    45	# ifdef __NR_clock_gettime64
    46	  /* Avoid issue a __NR_clock_gettime64 syscall on kernels that do not
    47	     support 64-bit time_t.  */
    48	  static int time64_support = 1;
    49	  if (atomic_load_relaxed (&time64_support) != 0)
    50	    {
    51	#  ifdef HAVE_CLOCK_GETTIME64_VSYSCALL
    52	      r = INLINE_VSYSCALL (clock_gettime64, 2, clock_id, tp);
    53	#  else
    54	      r = INLINE_SYSCALL_CALL (clock_gettime64, clock_id, tp);
    55	#  endif
    56	      if (r == 0 || errno != ENOSYS)
    57		return r;
    58	
    59	      atomic_store_relaxed (&time64_support, 0);
    60	    }
 
Source code of mips sysdep.h (thet defines HAVE_CLOCK_XXX)
----------------------------------------------------------

From 'cat -n sysdeps/unix/sysv/linux/mips/sysdep.h'

    24	/* List of system calls which are supported as vsyscalls.  */
    25	#define HAVE_CLOCK_GETTIME_VSYSCALL     "__vdso_clock_gettime"
    26	#if _MIPS_SIM != _ABI64
    27	# define HAVE_CLOCK_GETTIME64_VSYSCALL  "__vdso_clock_gettime64"
    28	#endif
    29	#define HAVE_GETTIMEOFDAY_VSYSCALL      "__vdso_gettimeofday"
    30	#define HAVE_CLOCK_GETRES_VSYSCALL      "__vdso_clock_getres"
    31	

I.e for n64 where _MIPS_SIM == _ABI64, HAVE_CLOCK_GETTIME64_VSYSCALL is not
defined. As result clock_gettime64 would take line 40 and issue regular
systemcall in case of gettimeofday for MIPS n64

N32 abi gettimeofday goes through vsyscall
==========================================

(gdb) bt
#0  0x7fff67e8 in __vdso_clock_gettime64 ()
#1  0x77ed4064 in __GI___clock_gettime64 (clock_id=0, tp=0x7fff2be0)
    at ../sysdeps/unix/sysv/linux/clock_gettime.c:52
#2  0x77ed41bc in __GI___clock_gettime (clock_id=<optimized out>, 
    tp=0x7fff2c10) at ../sysdeps/unix/sysv/linux/clock_gettime.c:82
#3  0x77ec7934 in ___gettimeofday (tv=0x7fff2c40, tz=<optimized out>)
    at ../time/gettimeofday.c:32
#4  0x55550788 in main () at gettimeofday.c:7

Basically since HAVE_CLOCK_GETTIME64_VSYSCALL is defined for _MIPS_SIM != _ABI64
in n32 code takes vsyscall path and o32 should go through vsyscall, but
not -mabi=64. Let's further track it as separate issue (outside of this write
up)

Disassemble of __vdso_clock_gettime64
-------------------------------------

(gdb) disassemble __vdso_clock_gettime64
Dump of assembler code for function __vdso_clock_gettime64:
   0x7fff67c8 <+0>:	addiu	sp,sp,-32
   0x7fff67cc <+4>:	sd	gp,16(sp)
   0x7fff67d0 <+8>:	lui	gp,0x0
   0x7fff67d4 <+12>:	addu	gp,gp,t9
   0x7fff67d8 <+16>:	sltiu	v0,a0,16
   0x7fff67dc <+20>:	sd	ra,24(sp)
   0x7fff67e0 <+24>:	sd	s0,8(sp)
   0x7fff67e4 <+28>:	addiu	gp,gp,-1992
=> 0x7fff67e8 <+32>:	move	s0,a0
   0x7fff67ec <+36>:	move	a2,a1
   0x7fff67f0 <+40>:	bal	0x7fff67fc <__vdso_clock_gettime64+52>
   0x7fff67f4 <+44>:	nop
   0x7fff67f8 <+48>:	sd	ra,-2040(ra)
   0x7fff67fc <+52>:	lw	v1,0(ra)
   0x7fff6800 <+56>:	addu	v1,ra,v1
   0x7fff6804 <+60>:	beqz	v0,0x7fff6850 <__vdso_clock_gettime64+136>
   0x7fff6808 <+64>:	li	v0,1
   0x7fff680c <+68>:	sllv	v0,v0,s0
   0x7fff6810 <+72>:	andi	a1,v0,0x883
   0x7fff6814 <+76>:	beqz	a1,0x7fff6870 <__vdso_clock_gettime64+168>
   0x7fff6818 <+80>:	addiu	a0,v1,-4096
   0x7fff681c <+84>:	lw	t9,2504(gp)
   0x7fff6820 <+88>:	addiu	a3,a2,8
   0x7fff6824 <+92>:	addiu	t9,t9,720
   0x7fff6828 <+96>:	jalr	t9
   0x7fff682c <+100>:	move	a1,s0

GP takes value of vdso start
----------------------------

when at pc=0x7fff67e8

(gdb) p /x $gp
$1 = 0x7fff6000

From corresponding procss /proc/<pid>/maps

7fff6000-7fff7000 r-xp 00000000 00:00 0                                  [vdso]

Before executing jalr $9 at 0x7fff6828
--------------------------------------

(gdb) x /1i $pc
=> 0x7fff681c <__vdso_clock_gettime64+84>:	lw	t9,2504(gp)
(gdb) bt
#0  0x7fff681c in __vdso_clock_gettime64 ()
#1  0x77ed4064 in __GI___clock_gettime64 (clock_id=0, tp=0x7fff2be0)
    at ../sysdeps/unix/sysv/linux/clock_gettime.c:52
#2  0x77ed41bc in __GI___clock_gettime (clock_id=<optimized out>, 
    tp=0x7fff2c10) at ../sysdeps/unix/sysv/linux/clock_gettime.c:82
#3  0x77ec7934 in ___gettimeofday (tv=0x7fff2c40, tz=<optimized out>)
    at ../time/gettimeofday.c:32
#4  0x55550788 in main () at gettimeofday.c:7
(gdb) x /1ga $gp + 2504
0x7fff69c8:	0x2d0
(gdb) x /1wa $gp + 2504
0x7fff69c8:	0x0
(gdb) x /2wa $gp + 2504
0x7fff69c8:	0x0	0x2d0
(gdb) si
0x7fff6820 in __vdso_clock_gettime64 ()
(gdb) p /x $t9
$2 = 0x0
(gdb) display /i $pc
1: x/i $pc
=> 0x7fff6820 <__vdso_clock_gettime64+88>:	addiu	a3,a2,8
(gdb) si
0x7fff6824 in __vdso_clock_gettime64 ()
1: x/i $pc
=> 0x7fff6824 <__vdso_clock_gettime64+92>:	addiu	t9,t9,720
(gdb) si
0x7fff6828 in __vdso_clock_gettime64 ()
1: x/i $pc
=> 0x7fff6828 <__vdso_clock_gettime64+96>:	jalr	t9
   0x7fff682c <__vdso_clock_gettime64+100>:	move	a1,s0
(gdb) p /x $t9
$3 = 0x2d0

Crash after jumping to $t9
--------------------------

Program received signal SIGSEGV, Segmentation fault.
0x000002d0 in ?? ()
1: x/i $pc
=> 0x2d0:	<error: Cannot access memory at address 0x2d0>
(gdb) bt
#0  0x000002d0 in ?? ()
#1  0x7fff6830 in __vdso_clock_gettime64 ()
#2  0x77ed4064 in __GI___clock_gettime64 (clock_id=0, tp=0x7fff2be0)
    at ../sysdeps/unix/sysv/linux/clock_gettime.c:52
#3  0x77ed41bc in __GI___clock_gettime (clock_id=<optimized out>, 
    tp=0x7fff2c10) at ../sysdeps/unix/sysv/linux/clock_gettime.c:82
#4  0x77ec7934 in ___gettimeofday (tv=0x7fff2c40, tz=<optimized out>)
    at ../time/gettimeofday.c:32
#5  0x55550788 in main () at gettimeofday.c:7

Got table of

  [11] .got              PROGBITS        000009c0 0009c0 00000c 04 WAp  0   0 16

I.e .got table is address 0x9c0 and it 3 words in size.

(gdb) p /d 0x9c0
$1 = 2496

When vdso-n32.so.dbg in gdb

(gdb) x /100wx 0x00009c0
0x9c0:	0x00000000	0x80000000	0x00000000	Cannot access memory at address 0x9cc

After crash (recall $gp points to start of vdso):

(gdb) x /3wx $gp + 0x9c0
0x7fff69c0:	0x00000000	0x80000000	0x00000000

It seems the problem that vdso-n32.so contains 'jalr $t9'
instruction calling static function, but nobody sets GOT
table in this case.

Checked vdso code in 5.2 kernel tree - there is no 'jalr $t9'
calls there - it seems all code is just inlined! But after
unified vdso patch set and vdso code restructuring we have
need to call common static functions in vdso. And our
toolchain uses 'jalr $t9' for it.

Let's check what happens in o32 -mabi=32 user land case
=======================================================

Configure Yocto poky to run 64bit kernel with o32 user land

DEFAULTTUNE = 'mips64-o32'
DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'

It comes up OK!

And it could be seen that in this case offending 'jalr $t9' instructions
replaced by PC relative 'bal' instructions. I.e this vdso code looks
right!

Investigate why vdso code depends on gcc toolchain configuration
================================================================

We have kernel and vdso built by different MIPS toolchains that come
from the same 9.2.0 gcc source and the same 2.33.1.20191208 binutils
source but behave differently while compiling vdso code.

We have

mips64-poky-linux-gcc - configured for yocto 64 bit user land
                        uses 'jalr $t9'
mips64-poky-linux-gnun32-gcc - configured for yocto n32 user land 
                        uses 'jalr $t9'
mips-poky-linux-gcc - configure for yocto o32 user land uses 'bal'

objdump --disassemble --reloc for the same location of do_hres call
===================================================================

Observed that vgettimeoday.o code while calling do_hres uses 'jalr $t9'
in all cases! But in case of mips-poky-linux-gcc during vdso link
step 'jalr $t9' got converted into 'bal'. And this does not happen
in mips64-poky-linux-gcc and mips64-poky-linux-gnun32-gcc cases.
Let's investigate why

mips-poky-linux-gcc produces the following code
-----------------------------------------------

 268:   8f990000        lw      t9,0(gp)
                        268: R_MIPS_GOT_PAGE    .text
 26c:   27a70008        addiu   a3,sp,8
 270:   03a03025        move    a2,sp
 274:   27390000        addiu   t9,t9,0
                        274: R_MIPS_GOT_OFST    .text
 278:   0320f809        jalr    t9
                        278: R_MIPS_JALR        do_hres.isra.0
 27c:   02002825        move    a1,s0

mips64-poky-linux-gnun32-gcc produces the following code
--------------------------------------------------------

 268:   8f990000        lw      t9,0(gp)
                        268: R_MIPS_GOT_PAGE    .text
 26c:   27a70008        addiu   a3,sp,8
 270:   03a03025        move    a2,sp
 274:   27390000        addiu   t9,t9,0
                        274: R_MIPS_GOT_OFST    .text
 278:   0320f809        jalr    t9
 27c:   02002825        move    a1,s0

Note relocation R_MIPS_JALR is missing for instruction at 278 address

mips64-poky-linux-gcc produce code with missing relocation too
--------------------------------------------------------------

 268:   8f990000        lw      t9,0(gp)
                        268: R_MIPS_GOT_PAGE    .text
 26c:   27a70008        addiu   a3,sp,8
 270:   03a03025        move    a2,sp
 274:   27390000        addiu   t9,t9,0
                        274: R_MIPS_GOT_OFST    .text
 278:   0320f809        jalr    t9
 27c:   02002825        move    a1,s0

binutils mips bfd code that converts jalr into bal
--------------------------------------------------

in binutls bfd/elfxx-mips.c find code that converts 'jalr $t9'
into 'bal' while processing relocations:

static bfd_boolean
mips_elf_perform_relocation (struct bfd_link_info *info,
			     reloc_howto_type *howto,
			     const Elf_Internal_Rela *relocation,
			     bfd_vma value, bfd *input_bfd,
			     asection *input_section, bfd_byte *contents,
			     bfd_boolean cross_mode_jump_p)
...

  /* Try converting JAL to BAL and J(AL)R to B(AL), if the target is in
     range.  */
  if (!bfd_link_relocatable (info)
      && !cross_mode_jump_p
      && ((JAL_TO_BAL_P (input_bfd)
	   && r_type == R_MIPS_26
	   && (x >> 26) == 0x3)			/* jal addr */
	  || (JALR_TO_BAL_P (input_bfd)
	      && r_type == R_MIPS_JALR
	      && x == 0x0320f809)		/* jalr t9 */
	  || (JR_TO_B_P (input_bfd)
	      && r_type == R_MIPS_JALR
	      && (x & ~1) == 0x03200008)))	/* jr t9 / jalr zero, t9 */

Since R_MIPS_JALR relocation is missing conversion does not happen in case of
mips64-poky-linux-gnun32-gcc and mips64-poky-linux-gcc

Compare assembler of vgettimeofday between
and mips-poky-linux-gcc and mips64-poky-linux-gnun32-gcc

*** 1181,1188 ****
        addiu   $25,$25,%got_ofst(do_hres.isra.0)
        .set    noreorder
        .set    nomacro
!       .reloc  1f,R_MIPS_JALR,do_hres.isra.0
! 1:    jalr    $25
  .LVL60 = .
        move    $5,$16
        .set    macro
--- 1158,1164 ----
        addiu   $25,$25,%got_ofst(do_hres.isra.0)
        .set    noreorder
        .set    nomacro
!       jalr    $25
  .LVL60 = .
        move    $5,$16
        .set    macro

I.e R_MIPS_JALR relocation is present in mips-poky-linux-gcc

gcc build configuration logs: gcc_cv_as_ld_jalr_reloc
=====================================================

mips-poky-linux-gcc case
------------------------

In /home/kamensky/yocto/20200129_3/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips/9.2.0-r0

stashed-builddir/build/gcc/config.log:gcc_cv_as_ld_jalr_reloc=yes

[kamensky@svarog-cisco-com temp]$ pwd
/home/kamensky/yocto/20200129_3/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips/9.2.0-r0/temp
[kamensky@svarog-cisco-com temp]$ grep "assembler and linker for explicit JALR" log.do_compile
checking assembler and linker for explicit JALR relocation... yes

from gcc/config.log

configure:23608: checking assembler and linker for explicit JALR relocation
configure:23643: result: yes

mips64-poky-linux-gnun32-gcc case
---------------------------------

In /home/kamensky/yocto/20200129_2/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips64/9.2.0-r0

stashed-builddir/build/gcc/config.log:gcc_cv_as_ld_jalr_reloc=no

[kamensky@svarog-cisco-com temp]$ pwd
/home/kamensky/yocto/20200129_2/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips64/9.2.0-r0/temp
[kamensky@svarog-cisco-com temp]$ grep "assembler and linker for explicit JALR" log.do_compile
checking assembler and linker for explicit JALR relocation... no

from gcc/config.log

configure:23608: checking assembler and linker for explicit JALR relocation
/home/kamensky/yocto/20200129_2/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips64/9.2.0-r0/recipe-sysroot-native/usr/bin/mips64-poky-linux-gnun32/mips64-poky-linux-gnun32-ld: conftest.o: ABI is incompatible with that of the selected emulation
/home/kamensky/yocto/20200129_2/poky-contrib/build/tmp/work/x86_64-linux/gcc-cross-mips64/9.2.0-r0/recipe-sysroot-native/usr/bin/mips64-poky-linux-gnun32/mips64-poky-linux-gnun32-ld: failed to merge target specific data of file conftest.o
configure:23643: result: no

Check gcc/configure code that preforms the check
------------------------------------------------

    AC_MSG_CHECKING(assembler and linker for explicit JALR relocation)
    gcc_cv_as_ld_jalr_reloc=no
    if test $gcc_cv_as_mips_explicit_relocs = yes; then
      if test $in_tree_ld = yes ; then
        if test "$gcc_cv_gld_major_version" -eq 2 -a "$gcc_cv_gld_minor_version" -ge 20 -o "$gcc_cv_gld_major_version" -gt 2 \
           && test $in_tree_ld_is_elf = yes; then
          gcc_cv_as_ld_jalr_reloc=yes
        fi
      elif test x$gcc_cv_as != x -a x$gcc_cv_ld != x -a x$gcc_cv_objdump != x; then
        echo '	.ent x' > conftest.s
        echo 'x:	lw $2,%got_disp(y)($3)' >> conftest.s
        echo '	lw $25,%call16(y)($28)' >> conftest.s
        echo '	.reloc	1f,R_MIPS_JALR,y' >> conftest.s
        echo '1:	jalr $25' >> conftest.s
        echo '	.reloc	1f,R_MIPS_JALR,x' >> conftest.s
        echo '1:	jalr $25' >> conftest.s
        echo '	.end x' >> conftest.s
        if $gcc_cv_as -o conftest.o conftest.s >/dev/null 2>&AS_MESSAGE_LOG_FD \
           && $gcc_cv_ld -shared -o conftest.so conftest.o >/dev/null 2>&AS_MESSAGE_LOG_FD; then
	  if $gcc_cv_objdump -d conftest.so | grep jalr >/dev/null 2>&1 \
	     && $gcc_cv_objdump -d conftest.so | grep "bal.*<x>" >/dev/null 2>&1; then
            gcc_cv_as_ld_jalr_reloc=yes
	  fi
        fi
        rm -f conftest.*
      fi
    fi
    if test $gcc_cv_as_ld_jalr_reloc = yes; then
      if test x$target_cpu_default = x; then
        target_cpu_default=MASK_RELAX_PIC_CALLS
      else
        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
      fi
    fi
    AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)

I.e effect of this option would be MASK_RELAX_PIC_CALLS added to
default target_cpu

Checking for MASK_RELAX_PIC_CALLS in gcc
----------------------------------------

from gcc gcc/config/mips/mips.c

static void
mips_option_override (void)
{
  int i, start, regno, mode;
...

  /* Only optimize PIC indirect calls if they are actually required.  */
  if (!TARGET_USE_GOT || !TARGET_EXPLICIT_RELOCS)
    target_flags &= ~MASK_RELAX_PIC_CALLS;

GCC mips options
----------------

All above brings us to -mrelax-pic-calls -mexplicit-relocs options. Now if
I compile vgettimeofday with this option regardless how gcc was configured
for all cases mips-poky-linux-gcc, mips64-poky-linux-gnun32-gcc,
mips64-poky-linux-gcc R_MIPS_JALR is generated and linker convert 'jalr $t9'
into 'bal' call. That fixes the issue.

Victor Kamensky (2):
  mips: vdso: fix 'jalr t9' crash in vdso code
  mips: vdso: add build time check that no 'jalr t9' calls left

 arch/mips/vdso/Makefile | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.21.1

