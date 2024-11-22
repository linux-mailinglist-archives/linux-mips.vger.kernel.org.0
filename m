Return-Path: <linux-mips+bounces-6783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDA9D5848
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 03:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD3DB20A64
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 02:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F142A2AE84;
	Fri, 22 Nov 2024 02:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="uTljqE+4"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7995CB8
	for <linux-mips@vger.kernel.org>; Fri, 22 Nov 2024 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732242554; cv=none; b=OQlR71BlWJCNft9L4IuD9r6f8yEpP5ZAt7hzrgskqpfwVihylkBwETUFrTqItXjp1FkdrczmAbO9up+eoZ0I8HlBAG4cWnVH68+z/onWKJJ1KXPbqCOD3uaI0a7Y6sbCU3ysYuiU1Oztm+78MUpIsjoUIsyw6qfPK1bxiKxyPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732242554; c=relaxed/simple;
	bh=Q3kQYbKE/FKFQR9NHXTc+rB9a0KjYdIwJnKWcrjwjWk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cnjLzRaHrhT63/GmUuH+2MOX4el39+f1Ceq3pAQsOip0T5bYKiNYO/Xrt5sOAaK7j9LG3JgkvDu8IZlorlQ/iHXO46zlUNMGD4iStb17/D0q/qOMCelCYNI4iX8ngMoiFYwC3Ws971DPGkHFf/LMrLzEMp026DINKj+xg2Gig00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=uTljqE+4; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5ED112C0404;
	Fri, 22 Nov 2024 15:29:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1732242549;
	bh=Q3kQYbKE/FKFQR9NHXTc+rB9a0KjYdIwJnKWcrjwjWk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uTljqE+4Nq9YSWHOwm6vcKMSNxtmNYeqQAhwnCvtBLy+sT/uzQctN+oeCLOrM3tUi
	 8hdyTNiNcHpVaz87bpZn5GyRwl176txqAWmTeshxchLCTLaITRCyTKjIvfOSi0waVQ
	 llgVRmYPgvQS8FcVeCOYnQntZXAaYkCeDGJ/UnJdklYdagbcs6zfqSxuhoGV83Ikwp
	 MSMvRJkDO3EV5DqmAKngxHqexHAUI6jHtCeJjxc34q8lS2NvAZOH40dbXOS2am5bOm
	 A0elKEV5axc1NJbjf33GH56aY8dzKJxhKXzqdGeKftBbfjNL67Lc43XjuOta5pLwCx
	 HFjrtapWMpNug==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B673fec750000>; Fri, 22 Nov 2024 15:29:09 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4626213ED7B;
	Fri, 22 Nov 2024 15:29:09 +1300 (NZDT)
Message-ID: <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
Date: Fri, 22 Nov 2024 15:29:09 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Rong Xu <xur@google.com>,
 "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Masahiro Gotoh <gotoh@allied-telesis.co.jp>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
Content-Language: en-US
In-Reply-To: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gam0nhXL c=1 sm=1 tr=0 ts=673fec75 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=jOPVjXqlSLAbRJzf-WEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 22/11/24 14:58, Chris Packham wrote:
> Hi Rong,
>
> I was just trying some of my in-flight changes against linux-next and=20
> found that my RTL9300* based board no longer boots (nothing on the=20
> serial console after U-Boot hands off to the kernel).
>
> A bisect between Linus's tree and linux-next/master points to commit=20
> d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output=20
> section"). A build on d4a7f2510ff4^ boots successfully. That series is=20
> well beyond my area of knowledge, there may be something that the MIPS=20
> SoCs are doing (or not doing) that is being affected by the sections=20
> moving.

Based on the sparc change that accompanied this commit the following=20
does seem to restore working order for me:

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
index d575f945d422..e90b0f68290c 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -62,6 +62,8 @@ SECTIONS
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _text =3D .;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Text and read-only data */
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _stext =3D .;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text : {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Match text section symbols in head.S first */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *head.o(.text)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 TEXT_TEXT
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 SCHED_TEXT
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 LOCK_TEXT

No idea if that's appropriate


