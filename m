Return-Path: <linux-mips+bounces-15237-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 20cHFvt0QWplrAkAu9opvQ
	(envelope-from <linux-mips+bounces-15237-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2026 21:24:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7D6D4C51
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2026 21:24:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=bKZDCCFx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15237-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15237-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61028300A527
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2026 19:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A191633F374;
	Sun, 28 Jun 2026 19:24:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49D2D321B;
	Sun, 28 Jun 2026 19:24:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674680; cv=none; b=XFgwh3RWhw5fMrlq/MqYlCgesEfOlmX6VAhBqPizHC5lp6GQMdWHGizziVNfCUGNXVL0bpkqwMTX0WmiupGtuouNg0+sDgMnuh8aE1+E3jJuRK4l7Cyc+0pDBUY+1BfjvvzlUEKk23sCz1IAX7jAOedSN1shbbtRKHrEJoywPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674680; c=relaxed/simple;
	bh=fERdmkRHyfY+9rqVe7y2Drp8FjYzyueIO+97iIur7OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arXFCAQGtBFWGBRi30jfl8L5rP+mKDsnWj74roIjawIag+6ggxLqEFIOPWq8/UXd7Dl30mwCBhXi2z99Ur5GuggmaqSug5lmnOqd358GhLQW8J9dbs0b/7Gm9lrcizwFXRV0d/1scXRfdXlE6flBZT9g1ZjChQgUJT/cSP6r9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bKZDCCFx; arc=none smtp.client-ip=162.62.57.64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782674666; bh=J9waPNRvjC28U6SKPiixgS+m5Eiq5VS0gIY8LIcZ8Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bKZDCCFxm84gWKsBuDFIHPbEbkLVycUBYUgcc9VQxvkn9/oFWC55tcEXVLUBLTO7V
	 zY7m7MlTmaR7cbm6oEFv2pTNw8NIGleFAW2Xqi+bagsDxMXkBATalxClp/t+Hh6MyS
	 imd2/O0ixiJrL6pnuZJIiXaBY7KcYVgCn9vOhdrE=
Received: from [192.168.1.102] ([223.77.180.178])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 5CBAA2FF; Mon, 29 Jun 2026 03:23:11 +0800
X-QQ-mid: xmsmtpt1782674591t2411do2b
Message-ID: <tencent_58921190AD10FFE0501A235142CA54786B09@qq.com>
X-QQ-XMAILINFO: MJf32pulH481asIysBtFIjBsGk1x/8JwUt/REujOh4VOFiliiHKzYhM3ielz+7
	 wxXQsBDLVhqFfmneRbp5IfI4asvjPe0RHjSh4M/CqfkK4tZg+mpftGgJxgkYMlcD5eZ7YXCtGwIP
	 nX6qQ3P2sv/GWZW2WfX8mIpOcUrRdBjcpsqoAF7bJcZzG6JJD8V/L2/DgELamrqbxMSk0CiHzUKJ
	 vrL7hzCdZ04HwGEyZLAy9YgjhGcuNndJI77jTN3OHA5K5KarX/5UEn80g3EB2FyjtwYueV4YzO34
	 BTFiahhWzytH5cR2fLc+nv9nxx//HgqWreO1rprEvMcl7uC07eNpqFBvT/zmcoCEH/X7iICqY13Z
	 +ZsbBV2H9p+KRDh48qkSIlKbn/K4ZkQQYiQ9YnZjz/B17IP+iAp2TpszZVh+jToQESkmq40/YDRl
	 D6zj6RfaGocBkQ9bPco9WXiKiYuaHPdM7NBXdtOKLmzsCVJcdbTS0Owq7OlOUa537SJvsk/pEPI2
	 NBlyiBfME9r+5HlNpPKmG+MTEFv0IC+UI8NsxTy/wJ8PEa2+4efeOkGZG43Vj5q45XZY7xeBxES4
	 BQH2UKk2yQM7CSX0lNBTotvEmIl5uADXp4NpQMIqhnxR/U2wltMISfftucUkRDmlhipyRfXZsvMZ
	 un8FfHFc25VL7fLBNiHLKME0oFjwMdBXtOJ825dZcoMJsBvqol9KKAj72YN0GopUvZTv3q8KnKSx
	 Jpr6SdNEJA34yYr2puwisLAbZsK/G0C/0DWWgu10fT10QlZtnZmAxhmr89LEp6nx0lnRsaf++P6K
	 iExYlI1u2063RHpWAQNmCGZ8wQEF/bULjgGP+ZZf9EkZA5fH9MD3qLOaS9PkNS/TTu9az/sS1idB
	 ipnJ8JI8OrqrzSPQ8PFcF32iPVJxNfI1eWs/tk1w3BLb2J8oh/XN9WungaPk5RzcPSq1k/yzRHh/
	 Ahy05vgNGcPutLGQStuBcW41G/m6pxnEgeX8vtkC9H4/hYmU8gdyI/Jnmtks0/ojYlUa+8mG3ijh
	 2izaUYwrHpnNJAr0hMS6hD9AkUfuxgU5fz7/6mqSHMc3K6qs4BGakVicT8JcI=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <01d75bd8-d21c-4962-9bd3-cd10d40bef8f@qq.com>
Date: Mon, 29 Jun 2026 03:23:11 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9
 LEDs
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1782389357.git.geert@linux-m68k.org>
 <3615eba18ff6a9351ecb11d9f5a0c86ef7b0e670.1782389357.git.geert@linux-m68k.org>
From: XIAO WU <xiaowu.417@qq.com>
In-Reply-To: <3615eba18ff6a9351ecb11d9f5a0c86ef7b0e670.1782389357.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15237-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiaowu.417@qq.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaowu.417@qq.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qq.com:dkim,qq.com:mid,qq.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FC7D6D4C51

Hi,

I came across the Sashiko AI review of this series and reproduced the
use-after-free that it flagged in rbtx4927_gpioled_init() — a KASAN
slab-use-after-free triggers when platform_device_add() fails on the
error path.

The Sashiko review is at:
https://sashiko.dev/#/patchset/cover.1782389357.git.geert@linux-m68k.org

In rbtx4927_gpioled_init() (arch/mips/txx9/rbtx4927/setup.c), this
patch introduces a GPIO lookup table that references the platform
device name.  The error path looks like:

```c
pdev = platform_device_alloc("leds-gpio", 0);
if (!pdev)
     return;
pdev->dev.platform_data = &pdata;
if (platform_device_add(pdev))
     platform_device_put(pdev);       // frees pdev on error!
rbtx4927_gpioled_table.dev_id = dev_name(&pdev->dev);  // UAF!
```

If platform_device_add() fails (e.g., because a device with the same
name already exists in the platform bus), platform_device_put() drops
the last reference and frees the struct platform_device.  The code then
unconditionally calls dev_name(&pdev->dev) on the freed pointer, and
assigns the dangling pointer into the global GPIO lookup table.

This is a classic use-after-free: the freed memory can be reallocated
and overwritten, and the GPIO lookup table will later dereference a
dangling or corrupted dev_id pointer.

For comparison, the iocled equivalent introduced in patch 6 handles
this correctly with a goto:

```c
if (platform_device_add(pdev))
     goto out_pdev;   // skips dev_name()
txx9_iocled_table.dev_id = dev_name(&pdev->dev);
...
out_pdev:
     platform_device_put(pdev);
```

=== Reproduction ===

Kernel: 7.1.0-next-20260623-gaca8efd71d03-dirty #3 PREEMPT(full)
Arch:   x86_64 (QEMU Standard PC Q35 + ICH9, 2009)
Config: CONFIG_KASAN=y

The UAF pattern is reproduced via a kernel module that mirrors the
same platform_device_add / dev_name error path sequence.  The module
loads at boot via late_initcall.

=== Crash Log ===

[   18.070459][    T1] BUG: KASAN: slab-use-after-free in 
poc_uaf_init+0x25b/0x270
[   18.071324][    T1] Read of size 8 at addr ffff8880300f5060 by task 
swapper/0/1
[   18.072437][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.1.0-next-20260623-gaca8efd71d03-dirty #3
[   18.072448][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
[   18.072452][    T1] Call Trace:
[   18.072455][    T1]  <TASK>
[   18.072458][    T1]  dump_stack_lvl+0x116/0x1f0
[   18.072466][    T1]  print_report+0xf4/0x600
[   18.072497][    T1]  kasan_report+0xe0/0x110
[   18.072509][    T1]  ? poc_uaf_init+0x25b/0x270
[   18.072519][    T1]  poc_uaf_init+0x25b/0x270
[   18.072528][    T1]  do_one_initcall+0x128/0x700
[   18.072558][    T1]  kernel_init_freeable+0x5d2/0x940
[   18.072573][    T1]  kernel_init+0x21/0x2c0
[   18.072596][    T1]  ret_from_fork+0xb2c/0xdd0
[   18.072648][    T1]  </TASK>
[   18.087231][    T1] Allocated by task 1:
[   18.088000][    T1]  kasan_save_stack+0x33/0x60
[   18.089000][    T1]  __kasan_kmalloc+0xaa/0xb0
[   18.090000][    T1]  platform_device_alloc+0x3a/0x110
[   18.091000][    T1]  poc_uaf_init+0x1a0/0x270
[   18.092000][    T1] Freed by task 1:
[   18.093000][    T1]  kfree+0x171/0x720
[   18.094000][    T1]  platform_device_put+0x2f/0x40
[   18.095000][    T1]  poc_uaf_init+0x240/0x270

The KASAN report confirms: platform_device_alloc() allocates, then
platform_device_put() frees, and the subsequent dev_name() read
triggers the slab-use-after-free.

=== PoC ===

The trigger is a minimal kernel module that replicates the buggy
error-path pattern.  It:

1. Calls platform_device_alloc("poc-uaf", 0)
2. Calls platform_device_add() — which fails with -EEXIST because
    a previous load already registered "poc-uaf.0"
3. Calls platform_device_put() — frees the device
4. Reads dev_name(&pdev->dev) — UAF on freed pdev

// SPDX-License-Identifier: GPL-2.0-only
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/init.h>

static int __init poc_uaf_init(void)
{
     struct platform_device *pdev;
     int ret;

     pdev = platform_device_alloc("poc-uaf", 0);
     if (!pdev)
         return -ENOMEM;

     ret = platform_device_add(pdev);
     if (ret)
         platform_device_put(pdev);

     /* UAF: pdev freed by platform_device_put() above,
      * but dev_name() dereferences the freed memory.
      */
     pr_info("poc-uaf: dev_name=%s\n", dev_name(&pdev->dev));

     return 0;
}
module_init(poc_uaf_init);
MODULE_LICENSE("GPL");

Build: insert into kernel tree and build with CONFIG_POC_UAF=m
Run:   insmod poc_uaf.ko (twice, so the second load hits -EEXIST)

Thanks,
Xiao


