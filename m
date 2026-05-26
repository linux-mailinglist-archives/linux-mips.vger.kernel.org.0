Return-Path: <linux-mips+bounces-14771-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J65CiG8FWrKYQcAu9opvQ
	(envelope-from <linux-mips+bounces-14771-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:28:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808385D8B71
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 17:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F5C130FD02A
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B68403E98;
	Tue, 26 May 2026 14:51:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162E3400E0D;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807073; cv=none; b=MlnL75xwwUxfdUeYu/HpavSd5v33WKeMXIMPDVu9INRiuMi0vRpF31X9dlRQMEpx6iDXAfqialSIyhTtnhU2nLuF+0jqjNZjMnX9BtKedTdLJAJTAaOpklsRlNsQYDnIi9WzaZoO+itmCYJ5Z/+H891M+ETRcaguwIGK9Ar0XHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807073; c=relaxed/simple;
	bh=7oKspFFJhOhN/l1NfnJoxvwbUWLnkzSnp+qThZMYeXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnwfLv/10uYamc2xI1U3mMefQX6iguWfcyHPKucRhVBtssmIJouz9LIvPbBsAFyPIV9yiY/9v++fiRschKRDL//zKT3nzCZR1zNAtgYxnlURq42JGjSdistVbyHUGorO3eQDBX8RvBw0VWzD0XtCbkLg1nH03ptDuQv1oSK8RYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7d-00015m-00; Tue, 26 May 2026 16:51:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 06367C0852; Tue, 26 May 2026 16:46:12 +0200 (CEST)
Date: Tue, 26 May 2026 16:46:12 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 02/10] MIPS: DEC: Prevent initial console buffer from
 landing in XKPHYS
Message-ID: <ahWyNMag6EZNyykS@alpha.franken.de>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605062253010.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605062253010.46195@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14771-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,orcam.me.uk:email,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 808385D8B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 11:42:27PM +0100, Maciej W. Rozycki wrote:
> In 64-bit configurations calling the initial console output handler from 
> a kernel thread other than the initial one will result in a situation 
> where the stack has been placed in the XKPHYS 64-bit memory segment and 
> consequently so has been the buffer allocated there that is used as the 
> argument corresponding to the `%s' output conversion specifier for the 
> firmware's printf() entry point.
> 
> This 64-bit address will then be truncated by 32-bit firmware, resulting 
> in an attempt to access the wrong memory location, which in turn will 
> cause all kinds of unpredictable behaviour, such as a kernel crash:
> 
>   Console: colour dummy device 160x64
>   Calibrating delay loop... 49.36 BogoMIPS (lpj=192512)
>   pid_max: default: 32768 minimum: 301
>   CPU 0 Unable to handle kernel paging request at virtual address 000000000203bd00, epc == ffffffffbfc08364, ra == ffffffffbfc08800
>   Oops[#1]:
>   CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc2-00254-gfb649bda6f56-dirty #121
>   $ 0   : 0000000000000000 0000000000000001 0000000000000023 ffffffff80684ba0
>   $ 4   : 000000000203bd00 ffffffffbfc0f3b4 ffffffffffffffff 0000000000000073
>   $ 8   : 0a303d7469000000 0000000000000000 0000000000000073 ffffffffbfc0f473
>   $12   : 0000000000000002 0000000000000000 ffffffff80684c1c 0000000000000000
>   $16   : 0000000000000000 ffffffff80596dc9 0000000000000000 ffffffffbfc09240
>   $20   : ffffffff80684c40 ffffffffbfc0f400 000000000000002d 000000000000002b
>   $24   : ffffffffffffffbf 000000000203bd00                                  
>   $28   : ffffffff805f0000 ffffffff80684b58 0000000000000030 ffffffffbfc08800
>   Hi    : 0000000000000000
>   Lo    : 0000000000000aa8
>   epc   : ffffffffbfc08364 0xffffffffbfc08364
>   ra    : ffffffffbfc08800 0xffffffffbfc08800
>   Status: 140120e2        KX SX UX KERNEL EXL 
>   Cause : 00000008 (ExcCode 02)
>   BadVA : 000000000203bd00
>   PrId  : 00000430 (R4000SC)
>   Modules linked in:
>   Process swapper (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
>   Stack : 0000000000000000 0000000000000000 0000000000000000 0000004d0000004d
>           80684cc0806a2a40 80596dc80000004d 8061000000000000 bfc0850c80684c38
>           0000000000000000 000000000203bd00 0000000000000000 0000000000000000
>           0000000000000000 00000000bfc0f3b4 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 0000000000000000 0000000000000000
>           0000002500000000 0000000000000000 0000000000000000 802c1a7400000000
>           0203bd0080596dc8 0203bd4d69000000 6c61632000000018 5f746567646e6172
>           6c616320625f6d6f 5f736e5f6d6f7266 206361323778302b 303d74696e726320
>           806a0a38806b0000 806a0a38806b0000 00000000806b0000 80683c58806b0000
>           ...
>   Call Trace:
>   
>   
>   Code: a082ffff  03e00008  00601021 <80820000> 00001821  10400005  24840001  80820000  24630001 
>   
>   ---[ end trace 0000000000000000 ]---
>   Kernel panic - not syncing: Fatal exception in interrupt
>   
>   KN04 V2.1k    (PC: 0xa0026768, SP: 0x806848e8)
>   >>
> 
> In this case the pointer in $4 was truncated from 0x980000000203bd00 to 
> 0x000000000203bd00.
> 
> This may happen when no final console driver has been enabled in the 
> configuration and consequently the initial console continues being used 
> late into bootstrap or with an upcoming change that will switch the zs 
> driver to use a platform device, which in turn will make the console 
> handover happen only after other kernel threads have already been 
> started.
> 
> Fix the issue by making the buffer static and initdata, and therefore 
> placed in the CKSEG0 32-bit compatibility segment, observing that the 
> console output handler is called with the console lock held, implying 
> no need for this code to be reentrant.  Add an assertion to verify the 
> buffer actually has been placed in a compatibility segment.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v2.6.12+
> ---
> Changes from v2, 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2605010059310.38805@angie.orcam.me.uk/>:
> 
> - Cast `buf' to `long' before casting to `int', fixing:
> 
>   In file included from ./include/linux/bug.h:5,
>                    from arch/mips/dec/prom/console.c:7:
>   arch/mips/dec/prom/console.c: In function 'prom_console_write':
>   arch/mips/dec/prom/console.c:21:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>      21 |         BUG_ON((long)buf != (int)buf);
>         |                             ^
>   ./arch/mips/include/asm/bug.h:34:44: note: in definition of macro 'BUG_ON'
>      34 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
>         |                                            ^
> 
> New change in v2.
> ---
>  arch/mips/dec/prom/console.c |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

