Return-Path: <linux-mips+bounces-9205-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B2AD3394
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 12:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBA33B5639
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 10:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B30828C2C9;
	Tue, 10 Jun 2025 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="teIVKaOm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3B284680;
	Tue, 10 Jun 2025 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551349; cv=none; b=GW8jKBl+HR3B3aohmffE2GqE5qZkGFTDwFDZVRUhG99+EFezId4MuhvvqnhXUa7avdLdwT4Li/664mzae/jrsNFrCQLTbQaQ1SHAF2oPKmYK+4yuUmOP8HFqNzI14fLFmgB97oXYy0/sk920NnTxMeV9k3o9j9k1vqqQydVs7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551349; c=relaxed/simple;
	bh=Rtd3pFuAhLEj1b++dY11/888BB8LN7Xu4DyIIFzdmvE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=CZTqu7QNWAbn2QyGwwq+Uk/wNuNXOIgm8Ozz1OV+Yvb/Nrgqu2cnZvCfiS5hFo/e8qoDJPKOPtp/+e4UePMS7H8o02sPliALNEtJMxECLk/nkHyT0AoclqZ1ANy5kNkMBNCoLA0h3vw31nHnG+f7QCyhPhI/hfDK/OXqYHit6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=teIVKaOm; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1749551324; x=1750156124; i=markus.elfring@web.de;
	bh=iplk9G/YUE6CdfGYRbp70bB5+UXPrtqOFc3uVsWuJLI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=teIVKaOmraJpH9b5udlaRX2XwEHJH8j76j0Ms6Sw7ViLdXrtAEp/LUQX/OlHe5fX
	 CoEyH9l75ZjtI4y0c3RXnzKtqxBPXMX18rGX7EukRTqpxGNCQwV1AD2ZmToxZuLz1
	 ujzs1TQIcyKp85AnjsPLfrQNCq4YWxHnPuk92WZDxseirZyULPK7OZ5Fp+540Pvy6
	 ed5Q0oWgZETXd2tmDYPiN/TvafUQCtvQyzMFTXxXrrtmu9MJB6lHTyMYH03shVIT3
	 yNWuArbF+Ja6u3d7olIRYbqPmoasC5aORIoO+vLc11MPo3bqvahd9JxmWy5/NJ88w
	 DJcAkjxHaHxh2qoJcQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.183]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mkmvj-1v6pYi47B9-00bVLU; Tue, 10
 Jun 2025 12:28:44 +0200
Message-ID: <d3066a18-2e78-43ae-ad3b-8931777ee265@web.de>
Date: Tue, 10 Jun 2025 12:28:43 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mips@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] MIPS: SGI-IP27: Delete an unnecessary check before kfree() in
 hub_domain_free()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6sDCa4Zz9iTo+8qgwRBAhbZqXlQPhEz5rIry9Gt9Y9huqtNkume
 CQFLuysP+UwRJNHPI8xMNOWyrUFjId5Ia0/nidX3ME3U47GsA8XuyPczOTCLOP9EK7PbTIz
 bWZsAfaGW6hNNcMbE5Sk4d5MQ3hImNzmj/ZH4yyXBOiW0QEKvtQ0V5fsVN5VZ+SVfbhfyoc
 D+bNDq4LK+rAwmcoP0WFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pORGXAqGw8o=;g/8gELKiq71z+3ouoZm/VuC5TEP
 GuB178+ZlBSO7KDetopSkvtrB0O+LJZUiGKy7ex3pUc2UXDMBbxIXhMsr7hH8b+m8XqswErvh
 UGtu1O+JUSu+aFoLQQMy9U5yhEcGYf+cvisZBHeiaUrtZDZpWRtzNFRHcgtTSLbzoSW7wUvKw
 vyzWZMhm34an73MA3FZSYwRPpUiHXnK2nP/eqmOKCi6wD4WOvg41MgU9TvxDHQl7AQf0JyR9/
 UJ3ripxP0nWYUVQJz3vNdf5MZ6KbQx80qxRulHlYU/JeskYLfuMRSsZQGyaS0oc4oF0g443YY
 0q+tbnuObpSO/MVXLQXZJ66Xtmb9H8dLRYgVF8MF1s6oY/T2VEaaROkVITh6/2rD8Wd+ldI7Q
 awjI/2BPHuA1M3uNjD6Kfw732DhyXs8Sn+3glCnxwZMQ3kgCWkzzdbKUbv3lAkLm3fw+KGrst
 ilIB8oq3fzsqQC+p1xfedCXo5JJ0Yo9NKK5C8lGlta2ViKKHJw4uBAiGzDtbqR4Zw9ws7Pjcf
 6GxgDa+DMq7jTjJjN37QqLqQnobKDcA+I/6I2t+vS/o78wW3uz0noTYKDjO1bmZ968rvQl67w
 XiCS+F2rXX3v+F4nZSwHMQQPORZTWWmHS/AI1xsEPoQFuUJMcqHljCdoiK+YaPoYom7j+chbO
 1H2jXwButm76grNSYth1sqpvcPEfWn9l70uLIjAV3Rq7qfb3Lg7OyLYSw6Qi0MLBMV0WVJVx9
 MExu/oTo9Hjna2ptwEEHNTNEm5hgX+Ro50YRhK3V+H0HsCNot/ESJy56emnzyGT8Z8ReeiKcv
 VJDbQ77mJpgzASYxEFOo+CfWpuq3edJCmXHuM4oqOF2KThZT/MdszQJu3q2msEPEmalHFjATb
 /aFvi8EcRIgR6fjhV/KlnZ5JS3XAYAkC8miHPBQlLAAv04PxMalbKBeWw+pvZ6jMtdswiKZ3X
 JsNBVfn3nxp9mLYdGKGylyoEwB0Jnx81UJTegqZovqEokFlMqRZG0WecbcHI5NUB0iMon4PUz
 Kg7qHnqgFqSi9mQ/JtbNHORCHEhZZs2etrDSEVm9VMGY49o+FQkIryYNGWskfzai6fAIoaMTK
 M9zD11t+dHoMq1dFAvv5BXc7iwzG+fuufAggbB7QG1TTm7z+nYH+MdylZKNv51wmbVfH6nRY5
 L/DBwhi5xrQ9s+FFrxIMpRZXBB535fJL1y2LqvV4emIjiinAa9NLvslN7iewcohMtOm/TF6Mp
 ZDn3LVCm7DFJDiBFyu7l+ow1g4i9qi3O35aNi3aaJROHXGDjTp8ZRxCixo+DijvWixnmpQvjK
 At3dOHDuJepR39c2M4iSYKz6+HRbjw3BkA8RrdiIVzmVZxbnk8fSNf9wApGTVOlCoE/DJ/Tom
 1FQ7nwVju+IChiWQar4HzVGy2TPxnqYN1DjpYR9JCAr4rt7P+508wEhayhRsGrB/LAXkLCJLi
 nR74emsH8jCo2Xc/hbLmP9cKgQbNHd4B/lk1yidg9Qw3txl8vtfN56Axt3OUOvtNY0of5p4ID
 w3NPI0CtCemS+6eOjFG2cFVWU9JR8/ve4cE7roQsGXfY2yKDrf8cLm1kMTDRBTkhPICSBY/Py
 uJnzsDuNoInD3fZVZ+5r3tcsnBC8dFYvxbwzgN+6w3tRJgV9GQKbAGOSIiG9w4jMpFuuFXCVf
 IDVNyrHoDWeYvqwMkyKEc2uATxukiFLKpmdDQxeg5uHuvPsDKOAQ1NBFLKc/ACj+L1bPIy9iA
 1TPACnaE3B3aSa9OyAMp2clPokWW8udhxlJ9Z6BrbBSNkLohPQhBdb6ckl05cCQBlj1tckenT
 4kSC4p4Sf1I3PjoMk7Vkc7LbU3W06q0plnusKiqLMu7RaGD1p9FX28vCbWNI4UjZadhu3hp5A
 0EEiFpym7X6BAQVEBNq5JHRSwF9azdpzEgYHH08+d4DiPURizAY3jINBFdPmDSQV7x85NO9up
 n6KQHcgB1Nj2B8MfXghCRYli56rhyYYsjC4BvlMvOa7JEbltR7NZCfgiLeuoNf6dJGA8zeNyR
 2fxHVqWQruE42nqePWDwwXslvyy92X9PRs7msYGQjiTB73xyDRHHQvVDCI+ni+Mfn5YD/1uGB
 7RVJAZo7hwQyzehCDOAW4P3/P7XOdGwqsS5QLufYGBXCEe/wKWp7fWBg+9wgxRdFOrvykS2lT
 YffQ/m//xkIAqA+NJsFUb2SHv5QE250KgAPZkgrl6fAN75Nv1WerFOwRnkVbZVFKpX1azwBcQ
 7t5cblbgbkMJPzJv1Md5n6yooE2e1/iD+H2e6RgQw/ZLedpqQglcXSs9FK1cTsMUxKwDMYG5P
 4y70vL7mk2sR4WltcUis8OHg50wRPWCO3sz/jxDdyoBb1xuG7g8fsrtTq/DSXR8If0RPIpXCH
 kysG3CnUZTp8DbeCjlu/9VmRB7zEfBRXXVPROE3hO5gNFb+trKJC958QSDGGdQwZ0cEBEeReK
 zl2tL4nGeaGUf1ElXUYfHSIbmyic3+nuXSzQfjUm5e6ECyvGjLapop03wFl7d3qTi3/sr3Qyz
 z1SwZmGaVNOEi4Uf8yaDBHzliFPklESvhH5FUVc3iUNfeEz+ZGECiHoGTOdx3YW1DB6W17ZLe
 AtzSVN26LJ+rcQXq8TKskA8LGEqY07XFEE/j2wQDTVw+NBVYR4CRu51gKvg6zD9bU/AUh/jzi
 ZlQeN9eFfoXcvMzMT/uqzQG8Mps/FJYqw+SjxaUN5hIRJ5OjHj+mP0HvbzSc9xQ0FQ5JKpv3u
 5m8MJOYZt379QoaxAG0mqiwzsdWEocW+i5qiUjsYO2KVH9m+Jz4E4vwgtl7yDrMrYQNBc0LPq
 Cgj0/1+VDhbPI9tf2skmkaSGur/b7qjQqNEfwIpRqsCmad6ZUq2DXHpjuY0+EQrGvTX5nRK91
 XrDNDYs+QTMXRVO8b9qM1NtIZ8d773Jhd+HFFTTD0JMqoY6XmU/Xs5XJLwYC6YZQNuCSfKOT6
 ks1g4J+hdkfF/ngaWnJVtHLAW9Nh71Mifbp7kldzrRdO1iyYC5m/bZxM3hwXf9WhU9G14JWB0
 LBTeBu7VlweAbIADwqfgs2uIO0kinMMqr3iQJ/+tzJZBiS+Aa1CaAk5KqBE/sWtNKJ40r7L5f
 go3NuRkGTNpN/3yvu0Vbz8tkXBwu90HH1D3W18j5LzD/8oUraAvVW+UC7Ooe7o0Un1xsEwbgn
 /SuXZ/MGxKLcbrGWxVJMwo2ix2F9y8Kg5QbhYdT9IR4IBNSCLBhWyGjXJEI3QhcPk2PCJT0P9
 PC5yN5uNXO32g5BFpMlk5lblljuDvN5O1DcTWCk5mZ8iNceXHi1o6bn6ZV3Lq8Nf2ZnRHgAup
 mI8zdw73E3FZ1NImqNkMG+FDAtZNpPzrsk6tNOodOZTL+Muw9c=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 10 Jun 2025 11:44:20 +0200

It can be known that the function =E2=80=9Ckfree=E2=80=9D performs a null =
pointer check
for its input parameter.
It is therefore not needed to repeat such a check before its call.

Thus remove a redundant pointer check.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/sgi-ip27/ip27-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 288d4d17eddd..20ef663af16e 100644
=2D-- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -165,7 +165,7 @@ static void hub_domain_free(struct irq_domain *domain,
 		return;
=20
 	irqd =3D irq_domain_get_irq_data(domain, virq);
-	if (irqd && irqd->chip_data)
+	if (irqd)
 		kfree(irqd->chip_data);
 }
=20
=2D-=20
2.49.0


