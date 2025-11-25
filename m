Return-Path: <linux-mips+bounces-12350-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0248C84623
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 11:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDF544E2DC5
	for <lists+linux-mips@lfdr.de>; Tue, 25 Nov 2025 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CD8CA4E;
	Tue, 25 Nov 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G/FxfQfd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B62DC76C
	for <linux-mips@vger.kernel.org>; Tue, 25 Nov 2025 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065460; cv=none; b=hHUq1Jn5SZTVRaWfDYEIm2q88qWzxSVREIrnre+PbEO1pRP6b1Gtxb3xShED+KpMCuwbpHl0nK6ue6JH5BZST6PRtrV/7V/ogEqY1ePQHeJrJbZYw2c4GSUUtSUDbjVWfXaK6Yj6pF9CFCdZfS8a5XaJPkzr4iR47i6YC8spTfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065460; c=relaxed/simple;
	bh=XtnIAqr9zd1hk0LhUNWlp/z0zwrbGoy9rjJyDbHFDAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=id/i1gquI50w3FIJHJUb4pIzKcmY2BaYaKy7yW/ITpQ53TvThiU8LcXYAaYcNFHjujMPHV+7Obgr1joXWYl8eZYig/J1R7zantd2S/sWhHy+s5r2Ej+CTpGVnYrjAQeCu/xlkWYtdLL3G44nYye5Gfl0tKABSm6fXFBGVXdAXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G/FxfQfd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8953C15D47;
	Tue, 25 Nov 2025 10:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98E1260705;
	Tue, 25 Nov 2025 10:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D889102F07FD;
	Tue, 25 Nov 2025 11:10:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764065451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lbMMNB8WhA7HpMZcBDX/qpRsZTnhD+MyyTYvyVLWGQo=;
	b=G/FxfQfduxbaHpP2QDONj1LwwQA5eocRHPWn3510CtDnJJLfMy1lE+C9V/CWTzj5tyVwKv
	UgTwbRSFojVP3cqHA3kyreB0OfFonaDETC/DcJZLczyMDwXqQTKlu8cNKHmg5IKTtGxb06
	bLrBss+hvS92RjzINpYZnpT89dvOU3SXxA5Dw+eERN5iSL27tZAgFb8/DTiJv4sEC/F+ey
	s4zVo69TlKIyOeCZx6by6HRC4AQPBk9lA/5hIbK4HyVC6ROJTyw80LakwnT+GbjznDK1ax
	qUHv2y+U8JJe+1qXazXqGmzm8CBdR1WGAmRfBzG4IXzjpwxAJV59yK5NpK8lgg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
In-Reply-To: <aSTT0gbH-NkDOH8A@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
 <87wm3f8mcb.fsf@BLaptop.bootlin.com> <aSTT0gbH-NkDOH8A@alpha.franken.de>
Date: Tue, 25 Nov 2025 11:10:49 +0100
Message-ID: <87tsyi8lsm.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Thomas,

> On Mon, Nov 24, 2025 at 04:46:44PM +0100, Gregory CLEMENT wrote:
>> Hello Thomas,
>>=20
>> > The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1=
d4a7c:
>> >
>> >   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/m=
ips-fixes_6.18_1
>> >
>> > for you to fetch changes up to 14b46ba92bf547508b4a49370c99aba76cb53b5=
3:
>> >
>> >   MIPS: kernel: Fix random segmentation faults (2025-11-21 13:24:05 +0=
100)
>> >
>> > ----------------------------------------------------------------
>> > - Fix CPU type in DT for econet
>> > - Fix for Malta PCI MMIO breakage for SOC-it
>> > - Fix TLB shutdown caused by iniital uniquification
>> > - Fix random seg faults
>> >
>> > ----------------------------------------------------------------
>> > Aleksander Jan Bajkowski (1):
>> >       mips: dts: econet: fix EN751221 core type
>> >
>> > Maciej W. Rozycki (2):
>> >       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
>> >       MIPS: mm: Prevent a TLB shutdown on initial uniquification
>>=20
>> Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
>> I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
>> we found that the culprit is the commit "MIPS: mm: Prevent a TLB
>> shutdown on initial uniquification".
>>=20
>> Here is the log from a vanilla v6.18-rc7:
>
> [..]
>
> I guess your cores have more than 64 TLB entries. The Octeon CPU has
> 256 entries... Patch below fixes the issue there.
>

I have applied this patch and tested it on EyeQ5 and EyeQ6H-based
boards, and it booted successfully.

you can add my

Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> Thomas.
>
> From b74abcb21103519ae48726c715d39a6aa3f57462 Mon Sep 17 00:00:00 2001
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Date: Mon, 24 Nov 2025 22:46:43 +0100
> Subject: [PATCH] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>
> Latest MIPS cores could have much more than 64 TLB entries, therefore
> allocate array for unification instead of placing a too small array
> on stack.
>
> Fixes: 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on initial uniquif=
ication")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/mm/tlb-r4k.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index 3facf7cc6c7d..577055b50c41 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -524,15 +524,19 @@ static int r4k_vpn_cmp(const void *a, const void *b)
>   */
>  static void r4k_tlb_uniquify(void)
>  {
> -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
>  	int tlbsize =3D current_cpu_data.tlbsize;
>  	int start =3D num_wired_entries();
> +	unsigned long *tlb_vpns;
>  	unsigned long vpn_mask;
>  	int cnt, ent, idx, i;
>=20=20
>  	vpn_mask =3D GENMASK(cpu_vmbits - 1, 13);
>  	vpn_mask |=3D IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>=20=20
> +	tlb_vpns =3D kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
> +	if (!tlb_vpns)
> +		return; /* pray local_flush_tlb_all() is good enough */
> +
>  	htw_stop();
>=20=20
>  	for (i =3D start, cnt =3D 0; i < tlbsize; i++, cnt++) {
> @@ -585,6 +589,7 @@ static void r4k_tlb_uniquify(void)
>  	tlbw_use_hazard();
>  	htw_start();
>  	flush_micro_tlb();
> +	kfree(tlb_vpns);
>  }
>=20=20
>  /*
> --=20
> 2.43.0
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

