Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C0130EB0A
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhBDDgj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:36:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49900 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234299AbhBDDg2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:36:28 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9d9axtgvDEDAA--.4897S5;
        Thu, 04 Feb 2021 11:35:36 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH v2 3/3] perf tools: Generate mips syscalls_n64.c syscall table
Date:   Thu,  4 Feb 2021 11:35:24 +0800
Message-Id: <1612409724-3516-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxb9d9axtgvDEDAA--.4897S5
X-Coremail-Antispam: 1UD129KBjvAXoW3tr43AFy8XFyfGw1xCw1kuFg_yoW8ArWkuo
        Z5KF1DJF17GrW5G3ZI9FW8JrW3CrW7KFy7CrWvyw1FqFyjyFWavw45Aa4fXw13A34vyws5
        JFW8WFyrZF48W3srn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUO77AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM28IrcIa0x
        kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
        1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
        GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JU2ksgUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Grab a copy of arch/mips/kernel/syscalls/syscall_n64.tbl and use it to
generate tools/perf/arch/mips/include/generated/asm/syscalls_n64.c file,
this is similar with commit 1b700c997500 ("perf tools: Build syscall table
.c header from kernel's syscall_64.tbl")

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: no changes

 tools/perf/Makefile.config                         |   3 +-
 tools/perf/arch/mips/Makefile                      |  18 ++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 ++
 .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  | 358 +++++++++++++++++++++
 tools/perf/check-headers.sh                        |   1 +
 tools/perf/util/syscalltbl.c                       |   4 +
 6 files changed, 415 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/mips/entry/syscalls/mksyscalltbl
 create mode 100644 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index e378add..3280366 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -32,7 +32,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
       NO_SYSCALL_TABLE := 0
     endif
   else
-    ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390))
+    ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc arm64 s390 mips))
       NO_SYSCALL_TABLE := 0
     endif
   endif
@@ -89,6 +89,7 @@ endif
 
 ifeq ($(ARCH),mips)
   NO_PERF_REGS := 0
+  CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   CFLAGS += -I../../arch/mips/include/uapi -I../../arch/mips/include/generated/uapi
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index 6e1106f..8bc0907 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -2,3 +2,21 @@
 ifndef NO_DWARF
 PERF_HAVE_DWARF_REGS := 1
 endif
+
+# Syscall table generation for perf
+out    := $(OUTPUT)arch/mips/include/generated/asm
+header := $(out)/syscalls_n64.c
+sysprf := $(srctree)/tools/perf/arch/mips/entry/syscalls
+sysdef := $(sysprf)/syscall_n64.tbl
+systbl := $(sysprf)/mksyscalltbl
+
+# Create output directory if not already present
+_dummy := $(shell [ -d '$(out)' ] || mkdir -p '$(out)')
+
+$(header): $(sysdef) $(systbl)
+	$(Q)$(SHELL) '$(systbl)' $(sysdef) > $@
+
+clean::
+	$(call QUIET_CLEAN, mips) $(RM) $(header)
+
+archheaders: $(header)
diff --git a/tools/perf/arch/mips/entry/syscalls/mksyscalltbl b/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
new file mode 100644
index 0000000..fb1f494
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
@@ -0,0 +1,32 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Generate system call table for perf. Derived from
+# s390 script.
+#
+# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
+# Changed by: Tiezhu Yang <yangtiezhu@loongson.cn>
+
+SYSCALL_TBL=$1
+
+if ! test -r $SYSCALL_TBL; then
+	echo "Could not read input file" >&2
+	exit 1
+fi
+
+create_table()
+{
+	local max_nr nr abi sc discard
+
+	echo 'static const char *syscalltbl_mips_n64[] = {'
+	while read nr abi sc discard; do
+		printf '\t[%d] = "%s",\n' $nr $sc
+		max_nr=$nr
+	done
+	echo '};'
+	echo "#define SYSCALLTBL_MIPS_N64_MAX_ID $max_nr"
+}
+
+grep -E "^[[:digit:]]+[[:space:]]+(n64)" $SYSCALL_TBL	\
+	|sort -k1 -n					\
+	|create_table
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
new file mode 100644
index 0000000..9164969
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -0,0 +1,358 @@
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# system call numbers and entry vectors for mips
+#
+# The format is:
+# <number> <abi> <name> <entry point>
+#
+# The <abi> is always "n64" for this file.
+#
+0	n64	read				sys_read
+1	n64	write				sys_write
+2	n64	open				sys_open
+3	n64	close				sys_close
+4	n64	stat				sys_newstat
+5	n64	fstat				sys_newfstat
+6	n64	lstat				sys_newlstat
+7	n64	poll				sys_poll
+8	n64	lseek				sys_lseek
+9	n64	mmap				sys_mips_mmap
+10	n64	mprotect			sys_mprotect
+11	n64	munmap				sys_munmap
+12	n64	brk				sys_brk
+13	n64	rt_sigaction			sys_rt_sigaction
+14	n64	rt_sigprocmask			sys_rt_sigprocmask
+15	n64	ioctl				sys_ioctl
+16	n64	pread64				sys_pread64
+17	n64	pwrite64			sys_pwrite64
+18	n64	readv				sys_readv
+19	n64	writev				sys_writev
+20	n64	access				sys_access
+21	n64	pipe				sysm_pipe
+22	n64	_newselect			sys_select
+23	n64	sched_yield			sys_sched_yield
+24	n64	mremap				sys_mremap
+25	n64	msync				sys_msync
+26	n64	mincore				sys_mincore
+27	n64	madvise				sys_madvise
+28	n64	shmget				sys_shmget
+29	n64	shmat				sys_shmat
+30	n64	shmctl				sys_old_shmctl
+31	n64	dup				sys_dup
+32	n64	dup2				sys_dup2
+33	n64	pause				sys_pause
+34	n64	nanosleep			sys_nanosleep
+35	n64	getitimer			sys_getitimer
+36	n64	setitimer			sys_setitimer
+37	n64	alarm				sys_alarm
+38	n64	getpid				sys_getpid
+39	n64	sendfile			sys_sendfile64
+40	n64	socket				sys_socket
+41	n64	connect				sys_connect
+42	n64	accept				sys_accept
+43	n64	sendto				sys_sendto
+44	n64	recvfrom			sys_recvfrom
+45	n64	sendmsg				sys_sendmsg
+46	n64	recvmsg				sys_recvmsg
+47	n64	shutdown			sys_shutdown
+48	n64	bind				sys_bind
+49	n64	listen				sys_listen
+50	n64	getsockname			sys_getsockname
+51	n64	getpeername			sys_getpeername
+52	n64	socketpair			sys_socketpair
+53	n64	setsockopt			sys_setsockopt
+54	n64	getsockopt			sys_getsockopt
+55	n64	clone				__sys_clone
+56	n64	fork				__sys_fork
+57	n64	execve				sys_execve
+58	n64	exit				sys_exit
+59	n64	wait4				sys_wait4
+60	n64	kill				sys_kill
+61	n64	uname				sys_newuname
+62	n64	semget				sys_semget
+63	n64	semop				sys_semop
+64	n64	semctl				sys_old_semctl
+65	n64	shmdt				sys_shmdt
+66	n64	msgget				sys_msgget
+67	n64	msgsnd				sys_msgsnd
+68	n64	msgrcv				sys_msgrcv
+69	n64	msgctl				sys_old_msgctl
+70	n64	fcntl				sys_fcntl
+71	n64	flock				sys_flock
+72	n64	fsync				sys_fsync
+73	n64	fdatasync			sys_fdatasync
+74	n64	truncate			sys_truncate
+75	n64	ftruncate			sys_ftruncate
+76	n64	getdents			sys_getdents
+77	n64	getcwd				sys_getcwd
+78	n64	chdir				sys_chdir
+79	n64	fchdir				sys_fchdir
+80	n64	rename				sys_rename
+81	n64	mkdir				sys_mkdir
+82	n64	rmdir				sys_rmdir
+83	n64	creat				sys_creat
+84	n64	link				sys_link
+85	n64	unlink				sys_unlink
+86	n64	symlink				sys_symlink
+87	n64	readlink			sys_readlink
+88	n64	chmod				sys_chmod
+89	n64	fchmod				sys_fchmod
+90	n64	chown				sys_chown
+91	n64	fchown				sys_fchown
+92	n64	lchown				sys_lchown
+93	n64	umask				sys_umask
+94	n64	gettimeofday			sys_gettimeofday
+95	n64	getrlimit			sys_getrlimit
+96	n64	getrusage			sys_getrusage
+97	n64	sysinfo				sys_sysinfo
+98	n64	times				sys_times
+99	n64	ptrace				sys_ptrace
+100	n64	getuid				sys_getuid
+101	n64	syslog				sys_syslog
+102	n64	getgid				sys_getgid
+103	n64	setuid				sys_setuid
+104	n64	setgid				sys_setgid
+105	n64	geteuid				sys_geteuid
+106	n64	getegid				sys_getegid
+107	n64	setpgid				sys_setpgid
+108	n64	getppid				sys_getppid
+109	n64	getpgrp				sys_getpgrp
+110	n64	setsid				sys_setsid
+111	n64	setreuid			sys_setreuid
+112	n64	setregid			sys_setregid
+113	n64	getgroups			sys_getgroups
+114	n64	setgroups			sys_setgroups
+115	n64	setresuid			sys_setresuid
+116	n64	getresuid			sys_getresuid
+117	n64	setresgid			sys_setresgid
+118	n64	getresgid			sys_getresgid
+119	n64	getpgid				sys_getpgid
+120	n64	setfsuid			sys_setfsuid
+121	n64	setfsgid			sys_setfsgid
+122	n64	getsid				sys_getsid
+123	n64	capget				sys_capget
+124	n64	capset				sys_capset
+125	n64	rt_sigpending			sys_rt_sigpending
+126	n64	rt_sigtimedwait			sys_rt_sigtimedwait
+127	n64	rt_sigqueueinfo			sys_rt_sigqueueinfo
+128	n64	rt_sigsuspend			sys_rt_sigsuspend
+129	n64	sigaltstack			sys_sigaltstack
+130	n64	utime				sys_utime
+131	n64	mknod				sys_mknod
+132	n64	personality			sys_personality
+133	n64	ustat				sys_ustat
+134	n64	statfs				sys_statfs
+135	n64	fstatfs				sys_fstatfs
+136	n64	sysfs				sys_sysfs
+137	n64	getpriority			sys_getpriority
+138	n64	setpriority			sys_setpriority
+139	n64	sched_setparam			sys_sched_setparam
+140	n64	sched_getparam			sys_sched_getparam
+141	n64	sched_setscheduler		sys_sched_setscheduler
+142	n64	sched_getscheduler		sys_sched_getscheduler
+143	n64	sched_get_priority_max		sys_sched_get_priority_max
+144	n64	sched_get_priority_min		sys_sched_get_priority_min
+145	n64	sched_rr_get_interval		sys_sched_rr_get_interval
+146	n64	mlock				sys_mlock
+147	n64	munlock				sys_munlock
+148	n64	mlockall			sys_mlockall
+149	n64	munlockall			sys_munlockall
+150	n64	vhangup				sys_vhangup
+151	n64	pivot_root			sys_pivot_root
+152	n64	_sysctl				sys_ni_syscall
+153	n64	prctl				sys_prctl
+154	n64	adjtimex			sys_adjtimex
+155	n64	setrlimit			sys_setrlimit
+156	n64	chroot				sys_chroot
+157	n64	sync				sys_sync
+158	n64	acct				sys_acct
+159	n64	settimeofday			sys_settimeofday
+160	n64	mount				sys_mount
+161	n64	umount2				sys_umount
+162	n64	swapon				sys_swapon
+163	n64	swapoff				sys_swapoff
+164	n64	reboot				sys_reboot
+165	n64	sethostname			sys_sethostname
+166	n64	setdomainname			sys_setdomainname
+167	n64	create_module			sys_ni_syscall
+168	n64	init_module			sys_init_module
+169	n64	delete_module			sys_delete_module
+170	n64	get_kernel_syms			sys_ni_syscall
+171	n64	query_module			sys_ni_syscall
+172	n64	quotactl			sys_quotactl
+173	n64	nfsservctl			sys_ni_syscall
+174	n64	getpmsg				sys_ni_syscall
+175	n64	putpmsg				sys_ni_syscall
+176	n64	afs_syscall			sys_ni_syscall
+# 177 reserved for security
+177	n64	reserved177			sys_ni_syscall
+178	n64	gettid				sys_gettid
+179	n64	readahead			sys_readahead
+180	n64	setxattr			sys_setxattr
+181	n64	lsetxattr			sys_lsetxattr
+182	n64	fsetxattr			sys_fsetxattr
+183	n64	getxattr			sys_getxattr
+184	n64	lgetxattr			sys_lgetxattr
+185	n64	fgetxattr			sys_fgetxattr
+186	n64	listxattr			sys_listxattr
+187	n64	llistxattr			sys_llistxattr
+188	n64	flistxattr			sys_flistxattr
+189	n64	removexattr			sys_removexattr
+190	n64	lremovexattr			sys_lremovexattr
+191	n64	fremovexattr			sys_fremovexattr
+192	n64	tkill				sys_tkill
+193	n64	reserved193			sys_ni_syscall
+194	n64	futex				sys_futex
+195	n64	sched_setaffinity		sys_sched_setaffinity
+196	n64	sched_getaffinity		sys_sched_getaffinity
+197	n64	cacheflush			sys_cacheflush
+198	n64	cachectl			sys_cachectl
+199	n64	sysmips				__sys_sysmips
+200	n64	io_setup			sys_io_setup
+201	n64	io_destroy			sys_io_destroy
+202	n64	io_getevents			sys_io_getevents
+203	n64	io_submit			sys_io_submit
+204	n64	io_cancel			sys_io_cancel
+205	n64	exit_group			sys_exit_group
+206	n64	lookup_dcookie			sys_lookup_dcookie
+207	n64	epoll_create			sys_epoll_create
+208	n64	epoll_ctl			sys_epoll_ctl
+209	n64	epoll_wait			sys_epoll_wait
+210	n64	remap_file_pages		sys_remap_file_pages
+211	n64	rt_sigreturn			sys_rt_sigreturn
+212	n64	set_tid_address			sys_set_tid_address
+213	n64	restart_syscall			sys_restart_syscall
+214	n64	semtimedop			sys_semtimedop
+215	n64	fadvise64			sys_fadvise64_64
+216	n64	timer_create			sys_timer_create
+217	n64	timer_settime			sys_timer_settime
+218	n64	timer_gettime			sys_timer_gettime
+219	n64	timer_getoverrun		sys_timer_getoverrun
+220	n64	timer_delete			sys_timer_delete
+221	n64	clock_settime			sys_clock_settime
+222	n64	clock_gettime			sys_clock_gettime
+223	n64	clock_getres			sys_clock_getres
+224	n64	clock_nanosleep			sys_clock_nanosleep
+225	n64	tgkill				sys_tgkill
+226	n64	utimes				sys_utimes
+227	n64	mbind				sys_mbind
+228	n64	get_mempolicy			sys_get_mempolicy
+229	n64	set_mempolicy			sys_set_mempolicy
+230	n64	mq_open				sys_mq_open
+231	n64	mq_unlink			sys_mq_unlink
+232	n64	mq_timedsend			sys_mq_timedsend
+233	n64	mq_timedreceive			sys_mq_timedreceive
+234	n64	mq_notify			sys_mq_notify
+235	n64	mq_getsetattr			sys_mq_getsetattr
+236	n64	vserver				sys_ni_syscall
+237	n64	waitid				sys_waitid
+# 238 was sys_setaltroot
+239	n64	add_key				sys_add_key
+240	n64	request_key			sys_request_key
+241	n64	keyctl				sys_keyctl
+242	n64	set_thread_area			sys_set_thread_area
+243	n64	inotify_init			sys_inotify_init
+244	n64	inotify_add_watch		sys_inotify_add_watch
+245	n64	inotify_rm_watch		sys_inotify_rm_watch
+246	n64	migrate_pages			sys_migrate_pages
+247	n64	openat				sys_openat
+248	n64	mkdirat				sys_mkdirat
+249	n64	mknodat				sys_mknodat
+250	n64	fchownat			sys_fchownat
+251	n64	futimesat			sys_futimesat
+252	n64	newfstatat			sys_newfstatat
+253	n64	unlinkat			sys_unlinkat
+254	n64	renameat			sys_renameat
+255	n64	linkat				sys_linkat
+256	n64	symlinkat			sys_symlinkat
+257	n64	readlinkat			sys_readlinkat
+258	n64	fchmodat			sys_fchmodat
+259	n64	faccessat			sys_faccessat
+260	n64	pselect6			sys_pselect6
+261	n64	ppoll				sys_ppoll
+262	n64	unshare				sys_unshare
+263	n64	splice				sys_splice
+264	n64	sync_file_range			sys_sync_file_range
+265	n64	tee				sys_tee
+266	n64	vmsplice			sys_vmsplice
+267	n64	move_pages			sys_move_pages
+268	n64	set_robust_list			sys_set_robust_list
+269	n64	get_robust_list			sys_get_robust_list
+270	n64	kexec_load			sys_kexec_load
+271	n64	getcpu				sys_getcpu
+272	n64	epoll_pwait			sys_epoll_pwait
+273	n64	ioprio_set			sys_ioprio_set
+274	n64	ioprio_get			sys_ioprio_get
+275	n64	utimensat			sys_utimensat
+276	n64	signalfd			sys_signalfd
+277	n64	timerfd				sys_ni_syscall
+278	n64	eventfd				sys_eventfd
+279	n64	fallocate			sys_fallocate
+280	n64	timerfd_create			sys_timerfd_create
+281	n64	timerfd_gettime			sys_timerfd_gettime
+282	n64	timerfd_settime			sys_timerfd_settime
+283	n64	signalfd4			sys_signalfd4
+284	n64	eventfd2			sys_eventfd2
+285	n64	epoll_create1			sys_epoll_create1
+286	n64	dup3				sys_dup3
+287	n64	pipe2				sys_pipe2
+288	n64	inotify_init1			sys_inotify_init1
+289	n64	preadv				sys_preadv
+290	n64	pwritev				sys_pwritev
+291	n64	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo
+292	n64	perf_event_open			sys_perf_event_open
+293	n64	accept4				sys_accept4
+294	n64	recvmmsg			sys_recvmmsg
+295	n64	fanotify_init			sys_fanotify_init
+296	n64	fanotify_mark			sys_fanotify_mark
+297	n64	prlimit64			sys_prlimit64
+298	n64	name_to_handle_at		sys_name_to_handle_at
+299	n64	open_by_handle_at		sys_open_by_handle_at
+300	n64	clock_adjtime			sys_clock_adjtime
+301	n64	syncfs				sys_syncfs
+302	n64	sendmmsg			sys_sendmmsg
+303	n64	setns				sys_setns
+304	n64	process_vm_readv		sys_process_vm_readv
+305	n64	process_vm_writev		sys_process_vm_writev
+306	n64	kcmp				sys_kcmp
+307	n64	finit_module			sys_finit_module
+308	n64	getdents64			sys_getdents64
+309	n64	sched_setattr			sys_sched_setattr
+310	n64	sched_getattr			sys_sched_getattr
+311	n64	renameat2			sys_renameat2
+312	n64	seccomp				sys_seccomp
+313	n64	getrandom			sys_getrandom
+314	n64	memfd_create			sys_memfd_create
+315	n64	bpf				sys_bpf
+316	n64	execveat			sys_execveat
+317	n64	userfaultfd			sys_userfaultfd
+318	n64	membarrier			sys_membarrier
+319	n64	mlock2				sys_mlock2
+320	n64	copy_file_range			sys_copy_file_range
+321	n64	preadv2				sys_preadv2
+322	n64	pwritev2			sys_pwritev2
+323	n64	pkey_mprotect			sys_pkey_mprotect
+324	n64	pkey_alloc			sys_pkey_alloc
+325	n64	pkey_free			sys_pkey_free
+326	n64	statx				sys_statx
+327	n64	rseq				sys_rseq
+328	n64	io_pgetevents			sys_io_pgetevents
+# 329 through 423 are reserved to sync up with other architectures
+424	n64	pidfd_send_signal		sys_pidfd_send_signal
+425	n64	io_uring_setup			sys_io_uring_setup
+426	n64	io_uring_enter			sys_io_uring_enter
+427	n64	io_uring_register		sys_io_uring_register
+428	n64	open_tree			sys_open_tree
+429	n64	move_mount			sys_move_mount
+430	n64	fsopen				sys_fsopen
+431	n64	fsconfig			sys_fsconfig
+432	n64	fsmount				sys_fsmount
+433	n64	fspick				sys_fspick
+434	n64	pidfd_open			sys_pidfd_open
+435	n64	clone3				__sys_clone3
+436	n64	close_range			sys_close_range
+437	n64	openat2				sys_openat2
+438	n64	pidfd_getfd			sys_pidfd_getfd
+439	n64	faccessat2			sys_faccessat2
+440	n64	process_madvise			sys_process_madvise
+441	n64	epoll_pwait2			sys_epoll_pwait2
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index dded93a..39eada9 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -146,6 +146,7 @@ check arch/x86/lib/insn.c             '-I "^#include [\"<]\(../include/\)*asm/in
 check_2 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
 check_2 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
 check_2 tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
+check_2 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/syscalls/syscall_n64.tbl
 
 for i in $BEAUTY_FILES; do
   beauty_check $i -B
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 03bd99d..a2e9068 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -34,6 +34,10 @@ static const char **syscalltbl_native = syscalltbl_powerpc_32;
 #include <asm/syscalls.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_ARM64_MAX_ID;
 static const char **syscalltbl_native = syscalltbl_arm64;
+#elif defined(__mips__)
+#include <asm/syscalls_n64.c>
+const int syscalltbl_native_max_id = SYSCALLTBL_MIPS_N64_MAX_ID;
+static const char **syscalltbl_native = syscalltbl_mips_n64;
 #endif
 
 struct syscall {
-- 
2.1.0

