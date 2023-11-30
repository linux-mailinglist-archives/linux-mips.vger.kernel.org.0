Return-Path: <linux-mips+bounces-405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06A7FED4F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 11:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAFC1C20E2F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 10:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7CF3B1AB;
	Thu, 30 Nov 2023 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J9gbblCP"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7E7E6;
	Thu, 30 Nov 2023 02:51:15 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0CBBC0004;
	Thu, 30 Nov 2023 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701341474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OYuYwJSN0zBGGKCXcfpkKinnK6s4X1Q2mTmPEnqu0w=;
	b=J9gbblCP/PJG4zi6R6neEcZSc4LAnSyAkuhoqSxz+p3EvsCRng3c01bFs7480l3HBd/TYg
	E7vmyNRweFZ24LhqlmhWXiHiwup1WIkukPgc7J8Eptv78kETmVKlwdd/zWvHxJMmiafz7t
	2gkBkLhJBsNY2ZUW8+3KaaAQ5bcl8PwxdrQkvazUdWfc/HGXSqkW+kDDtrwL/cZWPwfEy2
	Irahif5uLwuDuY+oLH/xrCXDvqTq8yDN1JojFX2EAdi/HxG5D5IAH93NWrJ0LeVe6BMING
	8K5BRggiIvjxiMgqVEWiEQlOgyDGiLYif3F58c9cI5XLCU9x13ogjGoBH/o/jw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Paul Burton
 <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 15/21] dt-bindings: mips: cpu: Add I-Class I6500
 Multiprocessor Core
In-Reply-To: <f443830a-ba16-4c5e-9260-6fb38a09cc10@linaro.org>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-16-gregory.clement@bootlin.com>
 <f443830a-ba16-4c5e-9260-6fb38a09cc10@linaro.org>
Date: Thu, 30 Nov 2023 11:51:13 +0100
Message-ID: <874jh3fra6.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Krzysztof,

> On 23/11/2023 16:26, Gregory CLEMENT wrote:
>> The MIPS Warrior I-class I6500 was announced by Imagination
>> Technologies in 2016 and is used in the Mobileye SoC EyeQ5.
>>=20
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Document=
ation/devicetree/bindings/mips/cpus.yaml
>> index cf382dea3922c..b5165cf103e94 100644
>> --- a/Documentation/devicetree/bindings/mips/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
>> @@ -39,6 +39,7 @@ properties:
>>        - mti,mips24KEc
>>        - mti,mips14KEc
>>        - mti,mips14Kc
>> +      - img,i6500
>
> Don't break the order of entries.

Do you mean alphabetic order ?

because actually the entries are not really in alphabetic order.

Should I send first, a patch like the following one ?

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentati=
on/devicetree/bindings/mips/cpus.yaml
index cf382dea3922c..9bc47868d28b6 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -23,22 +23,22 @@ properties:
       - brcm,bmips4380
       - brcm,bmips5000
       - brcm,bmips5200
-      - ingenic,xburst-mxu1.0
       - ingenic,xburst-fpu1.0-mxu1.1
       - ingenic,xburst-fpu2.0-mxu2.0
+      - ingenic,xburst-mxu1.0
       - ingenic,xburst2-fpu2.1-mxu2.1-smt
       - loongson,gs264
       - mips,m14Kc
-      - mips,mips4Kc
-      - mips,mips4KEc
-      - mips,mips24Kc
+      - mips,mips1004Kc
       - mips,mips24KEc
+      - mips,mips24Kc
+      - mips,mips4KEc
+      - mips,mips4Kc
       - mips,mips74Kc
-      - mips,mips1004Kc
       - mti,interaptiv
-      - mti,mips24KEc
       - mti,mips14KEc
       - mti,mips14Kc
+      - mti,mips24KEc
=20
   reg:
     maxItems: 1


Regards,

Gregory

>
> Best regards,
> Krzysztof
>

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

