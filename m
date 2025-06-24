Return-Path: <linux-mips+bounces-9465-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E0AE604B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9490E7A4DBC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 09:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF7C27AC4B;
	Tue, 24 Jun 2025 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="RWig66NC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4D27A90A
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756097; cv=none; b=TpWxIQUxgUUcCX3BvAHzSXK77rmOL6hsJ/fy6bXzDvt2HOS2zGtvoYlWmW5lo3UsE+z61JYR39e4dByvdWRWfyg3+WmfWWxivw1UtIph4T/bB06/f95blq8z1CTsQPx3C6v+0EHQi3emCbdiNX1qJISVakJ/L2ZcpuRaxWCzrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756097; c=relaxed/simple;
	bh=5WKKCWHFXDqqH5An8UZnpXVHdQMcfV5m1TnJvBNqIM4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oAOuW3CSuzG3UFHqKgcpcIqqiZQHryrS64JNdH/JELa30DOTY2SKuXKtc5OpkmHmU5yOmaK9bUjmiw/LJBMNXe/Jt/VW4xWLGMWO2MQboY4WfMVLP961aiXEjPMxHlTTbWZQo+hJ+IRm1oFtJwa45zxAgHkPVTu7Jr37o/d87/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=RWig66NC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4151015f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750756092; x=1751360892; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WGlx8yzYyb7R5Ea68xV7+gQv5IF8pex1PAwKtFxm+o=;
        b=RWig66NCML/jArAt8R5ZGpb48n/HMeEWH8sAZgjW7Xg7KlEyfHhgGJchs9TU3RBTuk
         p3a6D3U95W+xCmWHR/FQ0m5fjp0XUlAFa/oSFwCLA44abo0D1O1TODwjTrUhhT416Kzt
         v7LpF2Yl9EOhSlUExO7tlVDRdl3ngr5F6Vl9E5sglWjzp+I3+n9j4C9c8rerZQpEca4C
         l3vngqxowAUp8LuI2qLS87mosZ1Vn6AM+AeFcGUgN4WDah0iynxzFOZGy3886S6UopQN
         qr0VeKgMicKSyTSA4J/2hv72YO7lbID8bzya1zXKCLKNE8Gcrbg6792ovUrOaYgCtGLw
         tUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756092; x=1751360892;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WGlx8yzYyb7R5Ea68xV7+gQv5IF8pex1PAwKtFxm+o=;
        b=Qv5K/q6fl5uOoAXtKEXlK25cntEt4wj3wOu8Bt115M8toFBvLIck9WHEyB3/FJq//H
         pGWa5b5ITk1fNbCoU5jh+pNA+AY+9uJMEU65+yPJEB0gPSzFRVDpHBim41SH1vQOxK1V
         6yc/uYoQI89X9dHckE7tD3Gw+N+FRAquayjyEZbg+xY5Y5yfhPsDWKZ2G+cYNHxCkRUs
         SX3zfgd8S2rXEnQYP9slNiewV1d3mcCZ/uJ/MZp4a82IG4SMcykqZR0DaNUS3c1dq6xP
         e9CVPn8tF1aAFIqP8FcURHdV6pI1dfiXZ175vhB618lhlLT4c260xHt7wJAOulc3TXb6
         Yd1g==
X-Gm-Message-State: AOJu0Yz1Jho0AQR9iO492+isjZpgT0P8RzD68O5mMkivkEFGPX4fbsNb
	P0zNPQfk7QWNgevMiB5yULUaK0klORRdViIk+SCs1CyP4UXxho1swNu5UaD2tFD+yZ8=
X-Gm-Gg: ASbGnctO3ASgPmYA2vLZKAItxddGvvixn8XToz9z9x7TiJ2mHz0p4Yu4b85QqMuS/Js
	IOxVRw3O4nb1s4KN0hYTX53cz6h+d5VKZi16w1iA+bWGGhCe2rxu5bS1QM0YdIEM2owzxMbaXGh
	epqECoKb6IH5JBzT3IbkoqH8UU2xqMjzo070Rse5pBTXoxhlBP8ScEURH0w2GEEkXOZXB4qc4SA
	eEARcu3L2DCb/HCnyX594A1WXOBIS60LR5I4/Sk+LmoY+FIpcuwn1aVhjtORmOg9uCQm6IbYZii
	S3vPlupDuPWdCEsEZ7aA7bi3zovd0ORUe4Y93RRJpSxpyV/frTSr8DwmYZRXh01Uza6GMhkrTvq
	neR4MncyhAfX01s0=
X-Google-Smtp-Source: AGHT+IHIiGP2EXYtNWJFCTShYwnPbQfV9Yt33Xq0JCDLCavYNerSkXaiBRZSLpRhlXqq3hR0aB58vw==
X-Received: by 2002:a5d:6f0f:0:b0:3a4:f7e3:c63c with SMTP id ffacd0b85a97d-3a6d0f3d61amr14270045f8f.0.1750756091896;
        Tue, 24 Jun 2025 02:08:11 -0700 (PDT)
Received: from smtpclient.apple ([2a02:16a:7402:0:54f7:a1c1:3e0:3848])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7d8fsm133469355e9.15.2025.06.24.02.08.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:08:11 -0700 (PDT)
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
In-Reply-To: <20250620-unnatural-bloodhound-of-tenacity-4133bd@kuoka>
Date: Tue, 24 Jun 2025 11:08:00 +0200
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
Message-Id: <C75A767D-BD81-48CB-8D39-9FD19BA67E78@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
 <20250619203502.1293695-2-ezra@easyb.ch>
 <20250620-unnatural-bloodhound-of-tenacity-4133bd@kuoka>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

> On 20 Jun 2025, at 09:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
> On Thu, Jun 19, 2025 at 10:34:59PM GMT, Ezra Buehler wrote:
>> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>=20
>> As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi =
is
>> used for both SoCs. To prevent "Kernel panic - not syncing: unable to
>> get CPU clock, err=3D-2" and allow an MT7688-based board to boot, the
>> following must be allowed:
>>=20
>>    compatible =3D "ralink,mt7628-sysc", "ralink,mt7688-sysc", =
"syscon";
>>=20
>> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>> ---
>> .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 =
++++++++++---------
>> 1 file changed, 15 insertions(+), 12 deletions(-)
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml =
b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>> index 83c1803ffd16..3fabaa8acc10 100644
>> --- =
a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>> +++ =
b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>> @@ -26,18 +26,21 @@ description: |
>>=20
>> properties:
>>   compatible:
>> -    items:
>> -      - enum:
>> -          - ralink,mt7620-sysc
>> -          - ralink,mt7628-sysc
>> -          - ralink,mt7688-sysc
>=20
> I do not understand why this is removed and commit msg explains =
nothing
> about it. Re-add it back.

OK, so you suggest we allow

compatible =3D "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";

and

compatible =3D "ralink,mt7688-sysc", "syscon";

I'll adapt my patch accordingly.

Still, as AFAIK the MT7628 and MT7688 are identical in this regard,

compatible =3D "ralink,mt7688-sysc", "ralink,mt7628-sysc", "syscon";

would technically be valid too. Could you elaborate why that is not a
good idea? The MT7688 is basically a subset of the MT7628.

Cheers,
Ezra.


