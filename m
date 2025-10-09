Return-Path: <linux-mips+bounces-11635-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD50BC6FEC
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 02:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D7674E2690
	for <lists+linux-mips@lfdr.de>; Thu,  9 Oct 2025 00:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAE74A1A;
	Thu,  9 Oct 2025 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="QHi71B+T"
X-Original-To: linux-mips@vger.kernel.org
Received: from sonic304-22.consmr.mail.ne1.yahoo.com (sonic304-22.consmr.mail.ne1.yahoo.com [66.163.191.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E133D8
	for <linux-mips@vger.kernel.org>; Thu,  9 Oct 2025 00:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759969320; cv=none; b=Ryph02WA9O6lhIOOHRQVtyriSUIjZghhIcECYNZMHNxx318hxmIA0K0rXPq463z1ShHiQTCwUbWk1JdBuinz0LWuUJQB2gE+x5Fnq/5qGJZuuNNi9brHshkX70FGpaaIpYuRranI8rGnO+B+DxCaczlL0do3W9zqHom+SDEMpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759969320; c=relaxed/simple;
	bh=WKwJ1HSvTtLQcp46+5OozVn67WrPI9/d8878Tvmoqv8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=aBfIqjfj4Xm1gfHIeN60tRQm7uJHaQHkYM+M0bzhgYVO0wI3AI/PeEAio1wtVd8nWXOWDDdbLS4xod48V0azK6A01nb/dwcAsar/JAykCxyqqxJrg1MU6OmCAF+ws2ZbmV0CxQ9Aw1SYM1LAKraJCKBrHytmzOxuHBVCY8ZT9MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=QHi71B+T; arc=none smtp.client-ip=66.163.191.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1759969317; bh=WKwJ1HSvTtLQcp46+5OozVn67WrPI9/d8878Tvmoqv8=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=QHi71B+TUlxWlLXir6EKrwTVsYZXsXNodjmlmtQb5PM9kVYkVNEWUIEBHnQ23RIP/BtHDN9VvATNJo0zB3yLnYukpac5WfLQTVfqtkXxXq5/fz9x+4kFbrdoj8dHUek4twpqSzwvPr1i8xe3lVsoe3RvH13CF2/yAvDYKT16UxyDo46WthS9D9IGBsy4sAGunD0oaAUkrjGiPuVPUV7rvbzLJvOEjs1dwtC5MT9Urz65ononTGhj08KjSyy9jm3aV8B3R8p8P9gPbmw4d6fqg1HxGTgKrzp4Iepz3im1OmvBFfjHmgxvSUtF0HDdmH0UjdW3NO0o/3z0VfWhkWEGfA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1759969317; bh=WY+xrTxOzq4Iqqs6BGp9OL+oUo8SnQKe7EVSPU7PNBf=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=IqoZR7o4J5Lt41QFuZX1OTLKsFJ7wc5Z8noRuSAccWCbKQmoSw+rs/ZJm4/BVO8qLOpwnOsch9Z0El5+ZfAAJqprPerUtRlALsZfipk4EW3/jyheC/9dNEhdA56Yz16pimSPd1R+TBymSSk1rM8Hz36GFcQ/JqvfvwZe1ToD63eyEEEdlT5LfICkN67Dxe6RW4ttZYnimI03zVpo3QATg6/3BbV379nAlUjfRjy9SjD5kkUDn5Iz6bBDG83okSEJx14hj4AUu8evgyvORYa8Lpd09YpDKxl1s7D6A0VUfLHgt1/ys7YasLZKid0R5TsuAakaH67G0oBIjtjmKY5PiA==
X-YMail-OSG: 7WiQIBwVM1nn5b0N07Ne6Kfs1w9etM0nyidCty6aq9dADLnMXkIuxlHrryl.BuE
 Iy5p4h5Ba4c1mRtIG2OLDSBqMLspZEOmDsasrfDUF975G1GQn2zA_.F1gvA4KHD9y3IMhoG9KCdM
 WpQkfLky51sDLf_fNIDZn3ivMq6NyoNSl3zh5FTpLlsEmGvUgeSrqGqPOInQLSK3DcTt_I.lMjWO
 f37aDSSJJeN8UoUZZ9DUveIG7YqaWoCMtixuGp.oga51t_Vpy.8BFu16jP0X66h2ixyzTq.slRax
 VlrDmaXJf1bYLXvrVZsWUuySGnEtJCnRICg6Gvb2o75E24aBGZCl2cFLfcW5sMY_smTUdkgAUQl7
 wm4xzqPdNHJv2NFj6KRk6RV_uKKVjt61bNBg_AI9QzIZNz7OB_7KIWjdrytHiS00Tt1YkKDW9Nhq
 qoWVig6uyw3DucpCFTm7zUtj1Gbrsk.BVmwU2shGrX8joKuSUThFuc99.z0JrYKLmr8DlDvzAtaH
 pSnok0xSGAtoKLEpeAOEY3..6ddY22SvFvctHOMQaFmGxJQyzzODbtXwbLc2CYlTrTBfE3RFdnr2
 WjtuWdMhy5Rwr4.Kh74MmYMxEMBw3Cm01hul8X8mNMP6Qx_LfrouyPVOioMmevQPaAUH97yVdfkr
 qJSQ6AHjq7v0BRWce.GyI1Jkl4Uqoy8WMGJjvYlhjKfrQrtQnl8ADFGpvnuEQ77KhGpw_EjFbEku
 pUfQctaz4EYstVrxirVORQLN.9qbMFZaR.aT4bzNk9rrdfOmzad5NXK8OTiHdvelwKGiFLl_EKIi
 Mq4e2RNLMi5NjjXhbjr_9z9cHENr0Kqb3vzwab6bmF5v.AcO_CY5Y3_7hkFTMMYGJ.Nu3MeSq4yx
 m.XNm4VnoAWt2QY7vh_iR_cupt3Nn0lMKsgx11fIzMPrxFsKXiLaeU6pNOErvDunmt9FBLGF3GxQ
 cRfjVBBk9C6yYsOiSE.SuWmnxBKwSnPmDhPGkflwSgzdaTbppSAu.1Xs9lf5DuHBcagpSzQaMZzo
 Cf11eHysVMBWlvk._roZFcGPZhlvDHWwTn5G4Uxdnp2u5Ao.fA8g9jKVd4_uCCgxuVhRDSGkkuzN
 sZKWJHfbzKwXY8K6KVMKsPMInkmzvel1kLJDcIpeYTDGfxKT2XWGg0BpalEiqcP2itAvMwCONnaW
 NsU.p1XRsGa57ze6KTpqFITABjAPWEApLps5WXJCaodDpKS2Ggsb.ur.HqYNR7JJBGgP.TWLl8sq
 MBktJhic002jMH_l03hyhRVcSNyAXe4IBcx5z0Tl9TKcOIOfZtYLhsugpJc9M0xJNs5FYRcWje6V
 PtTAzg4k60BOiXC7E1Q2weV.zmWIbQDL.fytNdlprvMYMRhBELgeV.7WpgunP0U7.lVcvBb.4m_f
 McBLXpWJFaXVVH22WOjhzwU.wU.bYCnEcLEw_hY.L3DAtGt0I_sOUdWdjuxdN7WaE7OMxDv.Jwwt
 NHNfB1yiHglq0jn9tOpK4RDR8mnDSCdWYMKvhs1RkwCqCxNRS1sbAE.r33JMt5tetmpzNlDQE_0A
 Kv0pWmaYDZNhoK1WAn7NHuqVVylgUzREp2HenKdeTIm.OT5WSatTho1.jhkqHP3BtFmCbpaZWsKL
 GXQBUtKeiYpjNLksfIz5_Pnpw3qFhEI6T9Fuc5FVxZbwguMpxWNwhpUCs8AaVewGn35YZTcQYDzc
 Aak9SpyMszbOa5mk4xH2p4Ryf6XnygOnTH37ewowBjBixs__g.J9oZgkHDlxFb1bnCQC8QViKp_n
 A_raaPfcafQdhheZup1BPrCSvXztkZG47dNyzIqdQOvgLH5Qt7NQqsUHNvDUDDA.Wz_3X71nDKXA
 g9phshY5lrp_KdQi6yFo21HA9FGgIEnzOr2GrwG3xMTzj4uUM3Xa2NDmnHUpemvNTt5oTPq_dit2
 giKKPS0FMozWQlnHMqzmq4d0v5a6fFYmJ6SFEHQo0mh95t8ReIOc9LxaY775PGOvcwi4XyDcMPWM
 BlYSiqFEDpAg.5s3YTS2a8BdKoj68kVX3DCM.b.QvdE4Gcr9NyzimBfYKjiPNeNVuhSB1WqWuCxG
 8rwjXC5RlAOaNdwhvX4YF9UqdRzC4aH3V7gBB0KFVhpdRiwRYvvKZXrkyDxC6cfUPekxm1n.88gW
 4Ws329sP0tNTbh6OVc7i_J2MxdyTMbObyLmL56RBMOR0J4C1LfhKuvFV9Iw0ugMQifVXmMisjELs
 mVQpJl4xBowVnmXt3Vx8mBFCPKl1sSNe7
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 1484f465-0bc9-4930-8ecf-e3c42ab628ed
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Thu, 9 Oct 2025 00:21:57 +0000
Date: Thu, 9 Oct 2025 00:11:46 +0000 (UTC)
From: Mietek N <namiltd@yahoo.com>
To: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-ID: <825527059.1016043.1759968706607@mail.yahoo.com>
Subject: [PATCH] ramips/mt7620: IRQ-protect stack ASLR randomization  in
 arch_align_stack
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <825527059.1016043.1759968706607.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24562 YMailNorrin

On MT7620 (MIPS 24KEc), sporadic Oopses were observed during execve while
randomizing the new process stack in arch_align_stack(), which calls
get_random_u32_below(PAGE_SIZE).

On MIPS32, even the "<=3D16-bit" multiply path used by get_random_u32_below=
()
emits a 32-bit multiply and reads HI/LO via mfhi/mflo. If a hard IRQ fires
between multu and mfhi/mflo and its handler also executes mul/div, HI/LO ca=
n
be clobbered, leading to corrupted intermediates and bogus addresses.

Make the random stack offset computation IRQ-safe on MT7620 by wrapping the
get_random_u32_below(PAGE_SIZE) call with local_irq_save/restore(), ensurin=
g
the multu/mfhi/mflo sequence is not interrupted by hard IRQs. This preserve=
s
stack ASLR while eliminating the crash on this platform.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -715,8 +715,16 @@ unsigned long mips_stack_top(void)
=C2=A0 */
=C2=A0unsigned long arch_align_stack(unsigned long sp)
=C2=A0{
-=C2=A0 =C2=A0 if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize=
_va_space)
+=C2=A0 =C2=A0 if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize=
_va_space) {
#if defined(CONFIG_MIPS) && !defined(CONFIG_CPU_MIPSR6)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long flags;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_irq_save(flags);
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp -=3D get_random_u32_below(PAGE_SIZE);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_irq_restore(flags);
+#else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sp -=3D get_random_u32_below(PAGE_SIZE);
+#endif
+=C2=A0 =C2=A0 }

=C2=A0 =C2=A0 =C2=A0return sp & ALMASK;
=C2=A0}

