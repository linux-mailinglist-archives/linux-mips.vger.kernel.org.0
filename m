Return-Path: <linux-mips+bounces-9464-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF24AE6047
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF8A4077A6
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E71D27B519;
	Tue, 24 Jun 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="RWig66NC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675E27AC3C
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756096; cv=none; b=ri7nc/7zT1Shr/l4oPihZYCL+mdw6piasFeaKmn5TcBEa95zG6WEFZIsqR1k1AoO3nVw1G1NKK3QB5fOg51SYHk8FF3qBM1REeTrY9aJwa8Dqizk8pajmnggOhf8h4clOXTsk1bFfoEzcPfgF4hyTU+kSXjaQu36DJgFN+G4U34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756096; c=relaxed/simple;
	bh=5WKKCWHFXDqqH5An8UZnpXVHdQMcfV5m1TnJvBNqIM4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nC9j1B7eYD4bpQwtn6kd3IuYtimTg4piPh4NPLmKmvRKHVpepHHlF1xqD+0PNuHnT2UuOubdsxAn4W/3z54t51OdUyUqR6yYBaxq6jssscYcPd5IifS3EJ9t8VPy99Oi+fFr5iqHoG/uXdehIv5qo7VmQSRbiCdASzUdTBTgPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=RWig66NC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a589d99963so4938075f8f.1
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
        b=MARd50reKaeS17d+r55fAkN/fkvCV7asefUiqxC8kNCsRmDdR0VOykB6idNYdzbxqz
         KmBNlJ2ud+nFQVOypD9+mleQXIuG/itYCuPnzVn2asqyp9N2pmLLXnRN0jRUKcWMRUsU
         H6SKgZDDk7qfGdvpijFCxsb+gyCmzieLMnfpZA+CpzjevIZ2+EzhYDdgZDLkOn3gslvv
         IvHA7A1qYOTDHyDOYoiuDY4zglJwexLx1Io1CtFFK2535pceEBYOJ08oH68SInmX21OF
         JvVtfl8+MTzFZ9wyryeFsZcg3ztQL8RpOrq64OnOqOIKUiM3M6Q8/lBoKgt1FuCQbd8F
         2AiA==
X-Gm-Message-State: AOJu0Yw82d/7D5eWLaEreWpAGDsJfucnLrLlM7cc8Yg+z9qu5YrnzdK0
	mrEx+eKBNQFCLcPyLleNcE4Qli1RrWB5c6Axa1/2d3y4sjbAMZZWa+/UEiu12Gwqbx4=
X-Gm-Gg: ASbGncv2xL7DxVtd0NOILVDzduDvBTshZg00OgVXb59Pgpb1Er5a/SxJTtGmSk6YT5/
	shawAGwQIuseurPSe3FAogLh7qFDrPsbwqvelLIGAgMM4LHdUkUG7PoT6dOemSLyJMPTdhh64rN
	CCNkOjSK/015c0xw5ISWLBdxcbaihXjr953l7/aDvr08Ok9ro8en2iYJHJUPWL3zIvj68zD0L4y
	DognwHyde/vzXMqn1qee1FQe5+BhO5Wf29GW8YTGNQqN0SYJ4/WkRRiEG2kQKD+GGZxisC+yyKm
	aCCA2iDI/shlaVQQ0SEuj/CuTavHMLtbDRR8quFgFqrihAlEI3grYff4S4boa4gQbjVvEcxW9Cx
	SxXtQ
X-Google-Smtp-Source: AGHT+IFVLQyIkafga8ZmapRXTQA2a6f4RLzTA90MtdoXYtLDNP76GcT52leDn3drvEP9Ci/07cw57g==
X-Received: by 2002:a05:6000:70d:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3a6d12e5d07mr8857901f8f.41.1750756091615;
        Tue, 24 Jun 2025 02:08:11 -0700 (PDT)
Received: from smtpclient.apple ([2a02:16a:7402:0:54f7:a1c1:3e0:3848])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e7fb5716sm1439786f8f.0.2025.06.24.02.08.10
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


