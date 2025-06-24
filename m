Return-Path: <linux-mips+bounces-9467-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D0AE60B3
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFFC173902
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 09:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17231279DDA;
	Tue, 24 Jun 2025 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="24JfGFkJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE927AC2F
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756884; cv=none; b=oyHw1BrQyZ3vtdxtCT1Ckb/SgbSO5rOCLqyHfIYMP0pxjFw7RiU3aIbBgB5+QchBJ1AvPeVpYXs60thVJw3Y3ecIAgIxrG4JCAo9HxKS2G7l5d7fzS9OsRHcSFlcCRwZ1lUTGac+BaQ7z+icV8ojOItOfw9g4iZIRFtetXXu9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756884; c=relaxed/simple;
	bh=4Roq/W4hQ9coTMsn/ZxwRa/AYjAUnZ7hmUnYQZTY8Bw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NTO8qcb6JYdXbP+emO7wiAnsoQnRHtWF6uBgqa4lCxQoyCqp1zWzT9PxYWHFmBQwqP2XhP8jpJgX/TD9c7z4NKC0VchgZvxLTsDaPdyMMDuas136Dbv4AqvtGjp6FBSqGQkA3qtU/63VvdE0QaIL/setArdMOzw9A4VCC/ICybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=24JfGFkJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d7b50815so40070175e9.2
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750756881; x=1751361681; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgqmjJzaPxyt1ZsIY6295iEdPbXgM6l1ZFSOy0jxXTM=;
        b=24JfGFkJd9yKih869WgtpTrefGp5AyzWPL5SHO6RVoLSU5eDBW0rIN9rPtmht5qQsq
         44QBCnCPIlDxRf/MGUXqQrClmvVX7IGi9F7qNHgi9mER2/QwOGRu9md2zHfMX1X93W2/
         jy1hoi6JLde7N3oQL/ySwwMN4QgEk5Nd3NRuat9/u6bTno+fr12pj49T3+TUNQ1EEgn9
         owZXDQ02WydaY54x2G1CV4q75NoeFF649in6x6B8zHMlGY45j+Cjm9epmFZwn+sRPjJF
         c0fVv/0ythSpHBmzJarJhCq2sl6xPUNQ3AvkPrjmxtDCxsDu4783uh3boHySDBCDnfSX
         W8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756881; x=1751361681;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgqmjJzaPxyt1ZsIY6295iEdPbXgM6l1ZFSOy0jxXTM=;
        b=aJpw8qO8fiRP9kFWUJaoZIca0z2rt+O5W9LFsRChhPh8z94z41EsV40jJ5kb76++X2
         EJR9HHmW8QXS08mdmKNXVu821aHmCzzBpzwKsH0i0k7GfFZRKYeMHx+X1IeGF9nOBu+E
         p8lf5w3Fd6AeK7PSn0NmwFMInArEUgaLOFC53eomFl0ai0HvEuMnhUjytS6S8NwfE31X
         EhZORc7SoxNuq5JrD4QuXEfDyxW3Lynj3/9ur5Zck7MnYf0RyN6b80CFt/ao3Qt+wuoE
         Gmq2fcLtkdIsMBGhmoL2Ir7EZfjNZG8B3iF2jv/CHgrz8aKqtUt/rWlq9LoqDxfCDAl1
         nZuQ==
X-Gm-Message-State: AOJu0Yx02FumvD3798qiW5dU+rk8jMCijaYuAy0gJW+ggQvUMpCQSzYG
	aDvf5WGWxQFgq3VZOdJ0UbfQpFIM6ZT/VAk8QXk5w2oUbhHjqQ1PXIR3NusF5AbXrt4=
X-Gm-Gg: ASbGncsGnaIfDuJHhBVgsS/INmBcBVAO5kbNGxnLh8IFKMVg5EOqwitEKcd/nBVP0IW
	6d+wAkSmcX4Clb2xM8JraXY7VU0S9wiQvNWgGgg9/eDpP0BW4vr075mPhj30hINYPZ+AvjwCVZ3
	pcjvBTiYSWQ2sloD/xeQgD+f9qDd/VPbUYF6a92s35rdYVokOXLdcwowll8oeG+80tbfSyqkkAS
	abIaHJ2fch8sqYSbgFRVukJV5wml8Ky79WSjp001rKRylPaxbbvXe3Y56h091TAwrX2MGMo0Zyl
	yc/RdS2a+kYcdA7b7lAg5gm/CO8GWb5rmxzeaiZ/ViMVjbL7EeOLXThLpHIfZlHyqGWxGduQlfu
	FJ1hY
X-Google-Smtp-Source: AGHT+IEHGvWxG1VWj7rDXVCaYbdrbGUVQYD209E9iHHpArrPTW17K/tHD0lsgZerfKnxairsIipZDg==
X-Received: by 2002:a05:600c:1caa:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-453659ec1cemr131426705e9.19.1750756881065;
        Tue, 24 Jun 2025 02:21:21 -0700 (PDT)
Received: from smtpclient.apple ([2a02:16a:7402:0:54f7:a1c1:3e0:3848])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm137276985e9.2.2025.06.24.02.21.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:21:20 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
From: Ezra Buehler <ezra@easyb.ch>
In-Reply-To: <db2575e9-b7b2-4a44-8ef7-0979b3f1f60d@kernel.org>
Date: Tue, 24 Jun 2025 11:21:08 +0200
Cc: linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Rob Herring <robh@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Stefan Roese <sr@denx.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FFA8EEE4-65EF-420C-B041-76394BD8FF9E@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
 <20250619203502.1293695-2-ezra@easyb.ch>
 <20250620-unnatural-bloodhound-of-tenacity-4133bd@kuoka>
 <C75A767D-BD81-48CB-8D39-9FD19BA67E78@easyb.ch>
 <db2575e9-b7b2-4a44-8ef7-0979b3f1f60d@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 24 Jun 2025, at 11:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
> On 24/06/2025 11:08, Ezra Buehler wrote:
>>> On 20 Jun 2025, at 09:42, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:
>>>=20
>>> On Thu, Jun 19, 2025 at 10:34:59PM GMT, Ezra Buehler wrote:
>>>> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>>=20
>>>> As the MT7628 and MT7688 are identical in most respects, =
mt7628a.dtsi is
>>>> used for both SoCs. To prevent "Kernel panic - not syncing: unable =
to
>>>> get CPU clock, err=3D-2" and allow an MT7688-based board to boot, =
the
>>>> following must be allowed:
>>>>=20
>>>>   compatible =3D "ralink,mt7628-sysc", "ralink,mt7688-sysc", =
"syscon";
>>>>=20
>>>> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>> ---
>>>> .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 =
++++++++++---------
>>>> 1 file changed, 15 insertions(+), 12 deletions(-)
>>>>=20
>>>> diff --git =
a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml =
b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> index 83c1803ffd16..3fabaa8acc10 100644
>>>> --- =
a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> +++ =
b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> @@ -26,18 +26,21 @@ description: |
>>>>=20
>>>> properties:
>>>>  compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - ralink,mt7620-sysc
>>>> -          - ralink,mt7628-sysc
>>>> -          - ralink,mt7688-sysc
>>>=20
>>> I do not understand why this is removed and commit msg explains =
nothing
>>> about it. Re-add it back.
>>=20
>> OK, so you suggest we allow
>>=20
>> compatible =3D "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>>=20
>> and
>>=20
>> compatible =3D "ralink,mt7688-sysc", "syscon";
>>=20
>> I'll adapt my patch accordingly.
>>=20
>> Still, as AFAIK the MT7628 and MT7688 are identical in this regard,
>=20
> Standard rules apply expressed in writing bindings, some talks/guides
> and all modern SoCs...
>=20
>=20
>>=20
>> compatible =3D "ralink,mt7688-sysc", "ralink,mt7628-sysc", "syscon";
>>=20
>> would technically be valid too. Could you elaborate why that is not a
>> good idea? The MT7688 is basically a subset of the MT7628.
>=20
> You did not send such patch.

No, I did not. I am just trying to understand the topic better. Anyway,
never mind, I will just do it as you suggested.

Cheers,
Ezra.


