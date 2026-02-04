Return-Path: <linux-mips+bounces-13112-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANxGCjZ3g2mFmwMAu9opvQ
	(envelope-from <linux-mips+bounces-13112-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 17:43:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F7EA68C
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 17:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77A8300A39B
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 16:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7D41A0BF1;
	Wed,  4 Feb 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="qKC1/Jci"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1941B4223
	for <linux-mips@vger.kernel.org>; Wed,  4 Feb 2026 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223105; cv=none; b=gV2LOQrFjFZJkcHhBwTTSQy1k1anQxydKKaVXybUKuLL4iPWrl+hMM9jjGjzyob+4Nyk6WWQ5ArpoqTjDVe2Oatj/75RtjuuROUZhnlIC2/d2WwdwE/WpmJQBCJcetGmulivdv2XWlXvRZ1STW5yHgZDbQmzIp+UY+hok6SbDgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223105; c=relaxed/simple;
	bh=t/1WV6wF+pjy0GSD4AwaV6s4dMd5Rnd99mDIoqxNh5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqT37vxvS+bZhocq+9sNEl8dYtdbzDq6LCiLalBpCRTp6gAr2S3Wjc9HTSOzd/T7zd0gtW1F8hVgxu86qjYATYv0an4aJjNCCkopHcV4dhJuWlsfwlHrnpdnS3PTZyy6jkjdBIk7xxwdJU0tZo4u/wU1BGMMdX743pEbUM1hKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=qKC1/Jci reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1770223102; bh=t/1WV6wF+pjy0GSD4AwaV6s4dMd5Rnd99mDIoqxNh5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKC1/JciqbgfhNUYKnN4Zji9Bjl959K4HwFYqdA8+NFWPxpK9rR7K5TCsIPU4aBFu
	 Xp1DG1lWeYeZ/w3rImIOc2cYJYM333t6Ms1euV4cp91RPXo1CtztoAytKrHkadAd2e
	 yFr8KU2u2LaYq4Ipcz3BMSNo+X8jL69B/HCxZD08KchFoazGj72cpCm2kLvWd+atip
	 38tGfLZbHgXlvs1ovJp3aGeOfqVNbdlLI+ZaP+LA0U8PSovpWFu4CxYMnofoZW75Us
	 Anm/ODvr0bLZocHQB5hbQX8rbXaO3CacNAiIUNjsDs8cpgAMKTKov9TgLYE2ngOmBX
	 GLlEEiTF56Xug==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id CE35831E0BBD; Wed, 04 Feb 2026 17:38:22 +0100 (CET)
Date: Wed, 4 Feb 2026 17:38:22 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: serial console on Mikrotik RB532 non-working
Message-ID: <aYN1_mED5-IiKC4E@waldemar-brodkorb.de>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
 <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
 <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
 <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
 <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
 <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PnLiLkxTkpwMLrsp"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	TAGGED_FROM(0.00)[bounces-13112-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[openadk.org:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.938];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openadk.org:email]
X-Rspamd-Queue-Id: 796F7EA68C
X-Rspamd-Action: no action


--PnLiLkxTkpwMLrsp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mips people,
Jonas Gorski wrote,

> On Wed, Feb 4, 2026 at 12:19 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> >
> > Hi Jonas,
> > Jonas Gorski wrote,
> >
> > > Hi,
> > >
> > > On Tue, Feb 3, 2026 at 7:25 PM Waldemar Brodkorb <wbx@openadk.org> wrote:
> > > >
> > > > Hi Jiaxun,
> > > > Jiaxun Yang wrote,
> > > > >
> > > > > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > > > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > > > > >> Hi MIPS hackers,
> > > > > >>
> > > > > >> I want to use the latest Linux kernel on my Mikrotik RB532, but the
> > > > > >> serial console is non working. I bisected the problem and the first
> > > > > >> breaking change is this commit:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > Can you try this?
> > > > >
> > > > > Oops sorry I missed a flag, it should be:
> > > > >
> > > > > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> > > > > index 8ecb56be81ac..239018540221 100644
> > > > > --- a/arch/mips/rb532/devices.c
> > > > > +++ b/arch/mips/rb532/devices.c
> > > > > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
> > > > >  static struct plat_serial8250_port rb532_uart_res[] = {
> > > > >         {
> > > > >                 .type           = PORT_16550A,
> > > > > -               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
> > > > > +               .mapbase        = REGBASE + UART0BASE,
> > > > > +               .mapsize        = SZ_4K,
> > > > >                 .irq            = UART0_IRQ,
> > > > >                 .regshift       = 2,
> > > > >                 .iotype         = UPIO_MEM,
> > > > > -               .flags          = UPF_BOOT_AUTOCONF,
> > > > > +               .flags          = UPF_BOOT_AUTOCONF | UPF_IOREMAP,
> > > > >         },
> > > > >         {
> > > > >                 .flags          = 0,
> > > > >
> > > >
> > > > I tried the patch, but it still hangs here:
> > > >
> > > > RouterBOOT booter 2.18
> > > >
> > > > RouterBoard 532
> > > >
> > > > CPU frequency: 399 MHz
> > > >   Memory size:  32 MB
> > > >
> > > > Press any key within 3 seconds to enter setup...
> > > > trying dhcp protocol... OK
> > > > resolved mac address 9C:BF:0D:00:D6:4E
> > > > Gateway: 192.168.1.254
> > > > transfer started ........................................ transfer ok, time=525.70s
> > > > setting up elf image... OK
> > > > jumping to kernel code
> > > >
> > > > Nothing in tcpdump tries to mount nfs, so I believe serial console
> > > > breakage is not the only problem here.
> > >
> > > Have you tried the patch on top of master or
> > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?
> > >
> > > If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, then
> > > it fixes the serial issue, and you can do a new git bisect between
> > > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the next
> > > breakage, with the patch re-applied on top each step (so serial stays
> > > working).
> >
> > Yes, thanks for the idea. I already had this idea in mind and I am 9
> > steps before I get the next breakage :)
> >
> > Thanks for the heads up,
> 
> Also a small warning when doing a bisect with git am'd patches on top:
> always (git) reset to the original tested commit before doing git
> bisect <bood|bad>, else git bisect will account for these commits on
> top in calculating the next revision to test and may suggest the very
> same commit again you were originally testing.
> 
> It took a me a few steps until I noticed I was running in circles when
> I had to bisect with a few patches on top.

I just used patch and git stash for the job :)
So here is the result, the failing commit is:
commit 9f048fa487409e364cf866c957cf0b0d782ca5a3 (HEAD)
Author: Maciej W. Rozycki <macro@orcam.me.uk>
Date:   Thu Nov 13 05:21:10 2025 +0000

    MIPS: mm: Prevent a TLB shutdown on initial uniquification

    Depending on the particular CPU implementation a TLB shutdown may occur
    if multiple matching entries are detected upon the execution of a TLBP
    or the TLBWI/TLBWR instructions.  Given that we don't know what entries
    we have been handed we need to be very careful with the initial TLB
    setup and avoid all these instructions.

    Therefore read all the TLB entries one by one with the TLBR instruction,
    bypassing the content addressing logic, and truncate any large pages in
    place so as to avoid a case in the second step where an incoming entry
    for a large page at a lower address overlaps with a replacement entry
    chosen at another index.  Then preinitialize the TLB using addresses
    outside our usual unique range and avoiding clashes with any entries
    received, before making the usual call to local_flush_tlb_all().

    This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB
    entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual
    address).

    Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
    Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
    Cc: stable@vger.kernel.org
    Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Boston I6400, M5150 sim
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Reverting this commit, make the RB532 boot. I need the UART patch, too.

Attached is the dmesg from the device.

Anyone knows how to fix this issue?

best regards
 Waldemar



--PnLiLkxTkpwMLrsp
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg.txt"

[    0.000000] Linux version 6.19.0-rc8+ (wbx@fluor) (mipsel-openadk-linux-uclibc-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45.1) #50 Wed Feb  4 16:41:19 CET 2026
[    0.000000] CPU0 revision is: 0001800a (MIPS 4Kc)
[    0.000000] User-defined physical RAM map overwrite
[    0.000000] Primary instruction cache 8kB, VIPT, 4-way, linesize 16 bytes.
[    0.000000] Primary data cache 8kB, 4-way, VIPT, no aliases, linesize 16 bytes
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Kernel command line: console=ttyS0,115200 gpio=16383 mem=32M kmac=00:0C:42:0A:7D:D3 board=500 boot=1   console=ttyS0,115200 rw root=/dev/nfs ip=dhcp nfsroot=192.168.1.254:/srv/nfs/rb532
[    0.000000] korina mac = 00:0C:42:0A:7D:D3
[    0.000000] Unknown kernel command line parameters "gpio=16383 board=500 boot=1", will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8192
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 256
[    0.000000] Initializing IRQ's: 168 out of 256
[    0.000000] calculating r4koff... 
[    0.000000] 000c34f8(799992)
[    0.000000] CPU frequency 400.00 MHz
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556397797 ns
[    0.000010] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 10737525757ns
[    0.000236] Calibrating delay loop... 397.82 BogoMIPS (lpj=795648)
[    0.032139] pid_max: default: 32768 minimum: 301
[    0.033029] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.033136] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.042812] Memory: 26612K/32768K available (3993K kernel code, 542K rwdata, 548K rodata, 152K init, 188K bss, 5760K reserved, 0K cma-reserved)
[    0.044819] devtmpfs: initialized
[    0.053484] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.053636] posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
[    0.053740] futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, linear).
[    0.060069] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.062045] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.064668] PCI: Initializing PCI
[    0.070830] SCSI subsystem initialized
[    0.071977] libata version 3.00 loaded.
[    0.074816] PCI host bridge to bus 0000:00
[    0.074882] pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
[    0.074978] pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
[    0.075066] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.075217] pci 0000:00:00.0: [111d:0000] type 00 class 0x000000 conventional PCI endpoint
[    0.075353] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x07ffffff pref]
[    0.075449] pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
[    0.075512] pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
[    0.101583] pci 0000:00:02.0: [1106:3106] type 00 class 0x020000 conventional PCI endpoint
[    0.101736] pci 0000:00:02.0: BAR 0 [io  0x0000-0x00ff]
[    0.101831] pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x000000ff]
[    0.102022] pci 0000:00:02.0: supports D1 D2
[    0.102087] pci 0000:00:02.0: PME# supported from D1 D2 D3hot D3cold
[    0.102883] pci 0000:00:03.0: [1106:3106] type 00 class 0x020000 conventional PCI endpoint
[    0.103036] pci 0000:00:03.0: BAR 0 [io  0x0000-0x00ff]
[    0.103131] pci 0000:00:03.0: BAR 1 [mem 0x00000000-0x000000ff]
[    0.103322] pci 0000:00:03.0: supports D1 D2
[    0.103386] pci 0000:00:03.0: PME# supported from D1 D2 D3hot D3cold
[    0.104215] pci 0000:00:04.0: [13a3:0020] type 00 class 0x0b4000 conventional PCI endpoint
[    0.104368] pci 0000:00:04.0: BAR 0 [mem 0x00000000-0x00000fff]
[    0.104463] pci 0000:00:04.0: BAR 1 [mem 0x00000000-0x00001fff]
[    0.104553] pci 0000:00:04.0: BAR 2 [mem 0x00000000-0x00007fff]
[    0.584389] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.584536] pci 0000:00:04.0: BAR 2 [mem 0x50000000-0x50007fff]: assigned
[    0.584656] pci 0000:00:04.0: BAR 1 [mem 0x50008000-0x50009fff]: assigned
[    0.584771] pci 0000:00:04.0: BAR 0 [mem 0x5000a000-0x5000afff]: assigned
[    0.584887] pci 0000:00:02.0: BAR 0 [io  0x18800000-0x188000ff]: assigned
[    0.585003] pci 0000:00:02.0: BAR 1 [mem 0x5000b000-0x5000b0ff]: assigned
[    0.585119] pci 0000:00:03.0: BAR 0 [io  0x18800400-0x188004ff]: assigned
[    0.585235] pci 0000:00:03.0: BAR 1 [mem 0x5000b100-0x5000b1ff]: assigned
[    0.586040] clocksource: Switched to clocksource MIPS
[    0.595022] NET: Registered PF_INET protocol family
[    0.596277] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.599075] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.599207] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.599357] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.599483] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.599665] TCP: Hash tables configured (established 1024 bind 1024)
[    0.600026] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.600186] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.601161] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.603686] RPC: Registered named UNIX socket transport module.
[    0.603736] RPC: Registered udp transport module.
[    0.603769] RPC: Registered tcp transport module.
[    0.603802] RPC: Registered tcp-with-tls transport module.
[    0.603835] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.603971] PCI: CLS 16 bytes, default 16
[    0.607134] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.613358] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.621159] printk: legacy console [ttyS0] disabled
[    0.622542] serial8250.0: ttyS0 at MMIO 0x18058000 (irq = 104, base_baud = 12499875) is a 16550A
[    0.622738] printk: legacy console [ttyS0] enabled
[    1.299755] scsi host0: pata-rb532-cf
[    1.305007] ata1: PATA max PIO4 irq 149 lpm-pol 0
[    1.313888] eth0: korina-0.20 15Sep2017
[    1.318861] via-rhine 0000:00:02.0: enabling device (0080 -> 0083)
[    1.334840] via-rhine 0000:00:02.0 eth1: VIA Rhine III at (ptrval), 00:0c:42:0a:7d:d4, IRQ 142
[    1.345448] via-rhine 0000:00:02.0 eth1: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000
[    1.356989] via-rhine 0000:00:03.0: enabling device (0080 -> 0083)
[    1.372559] via-rhine 0000:00:03.0 eth2: VIA Rhine III at (ptrval), 00:0c:42:0a:7d:d5, IRQ 143
[    1.383162] via-rhine 0000:00:03.0 eth2: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000
[    1.395174] rc32434_wdt: Stopped watchdog timer
[    1.401166] rc32434_wdt: Watchdog Timer version 1.0, timer margin: 20 sec
[    1.410007] NET: Registered PF_PACKET protocol family
[    1.488756] korina korina eth0: link up, 100Mbps, full-duplex, lpa 0xFFFFFF6F
[    1.514213] Sending DHCP requests ., OK
[    1.542622] IP-Config: Got DHCP answer from 192.168.1.254, my address is 192.168.1.9
[    1.551409] IP-Config: Complete:
[    1.555148]      device=eth0, hwaddr=00:0c:42:0a:7d:d3, ipaddr=192.168.1.9, mask=255.255.255.0, gw=192.168.1.254
[    1.566657]      host=192.168.1.9, domain=, nis-domain=(none)
[    1.573201]      bootserver=192.168.1.254, rootserver=192.168.1.254, rootpath=
[    1.573275]      nameserver0=192.168.1.254
[    1.588787] check access for rdinit=/init failed: -2, ignoring
[    1.658499] VFS: Mounted root (nfs filesystem) on device 0:13.
[    1.667866] devtmpfs: mounted
[    1.671780] Freeing unused kernel image (initmem) memory: 152K
[    1.677854] This architecture does not have kernel memory protection.
[    1.684548] Run /sbin/init as init process
[    1.688861]   with arguments:
[    1.688920]     /sbin/init
[    1.688977]   with environment:
[    1.689027]     HOME=/
[    1.689082]     TERM=linux
[    1.689137]     gpio=16383
[    1.689193]     board=500
[    1.689248]     boot=1
[    1.723116] process '/bin/busybox' started with executable stack
[  208.334338] random: crng init done

--PnLiLkxTkpwMLrsp--

