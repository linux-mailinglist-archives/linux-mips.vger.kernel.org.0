Return-Path: <linux-mips+bounces-7615-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF5A2003E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 23:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA905165A67
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 22:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FB01DA31F;
	Mon, 27 Jan 2025 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urDla2YO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3419F489;
	Mon, 27 Jan 2025 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738015652; cv=none; b=tb/xNVOXLvGspu2GJAWHjnS3E1HovfoVWVieOFpI9NE/ZL/o0Pu11oxUWgBZx8ur7iLoIilGpFaNVatQx5cbkktkQHpwV2zFZWoIWAKuIYLPq5lZ6+iNRKbC4y5QGkeTNkswkldpOB1+ZhROsOAKYjPE6Vya2lFCyR5b5FmcCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738015652; c=relaxed/simple;
	bh=xMYiYQaNM+jLyoj66hyPR1TNcDEcbDN4T1G+iwpU5/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cew8atVmDc97YxkFxxa1Q2ULWhH/qFXS75MyD3CrkALULMwp5KTyhjNipHgVpruv06p1WHuhbTxEybADfPp5znponSSY4jz/c4pVk+x60dLz41euAr9Q8GKhHSFQ1SJvgocW9b1sMHfUnHN0DEwswcEh834ttTHF/342QRoefxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urDla2YO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB3EC4CEE5;
	Mon, 27 Jan 2025 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738015651;
	bh=xMYiYQaNM+jLyoj66hyPR1TNcDEcbDN4T1G+iwpU5/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=urDla2YOxHJV6DxNn/KG7TrLNN7IQ+KEfA0/yL87uxGDuDe89XwI1SxjUTj4QA+kW
	 EuDabzSwoiwUUkPckRqiRjqHcgG5JVu9o3q3wjgduXv4SGcUAjpbDcViYgog3R+CtM
	 JYer4XexYnyi0GjnhojE+YmKjWQHueuEdIJJicKnkhG3Z4TfICebCAjlNUO/cu0bxF
	 S3k3iOXVY9sl0jn07nX8koJMG7o39mW0uae/OOE7bBIi1Mb0QIkWucKV6rw9zKs3pR
	 7bikLPL1P/GeZAovRxy3GDiNJMidq2tKjbN6hDTalmaEyE4/82OBDdoEQ9+Hanomim
	 wrQKExCuZlbdg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54298ec925bso5996085e87.3;
        Mon, 27 Jan 2025 14:07:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaIBD/I7Pa+S8A0SOsIlmW/TQabtyN4bLP2w6JsO6B6Kv817cvXtafEjD3zn+CLTEiA2RlOgDAEGubwA==@vger.kernel.org, AJvYcCW0S0+v+iSo1Qbx59a3jrX4swfzAVJwEdYy29sj6qwSvxVhlnvXK0KHjqhNfWh+dNPu/rbsP9T1iKZc@vger.kernel.org, AJvYcCWMnkLijWlSYqreVuz/NEefGX3wsIib3XwjsonG7xOHV6NYYWSO8loAHSuKVEeGytGBdWJItno2e68PUVft@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Oq/ZnVP/zpV3yZGreadKAVhCZk0zU9+8/R0hYB2PRLvcMXtz
	eu8PNmMNTHR9j9WvHj0FFHtG08BEVv64J1aNUSC1D1oVaIex1UO4mFfjXJBXQ5zgly2JwQYOKtR
	ntkN1BFa8B5MQW0WXC3Hy4wktww==
X-Google-Smtp-Source: AGHT+IGYNFfCy7GyU3Xlj84Rbjj6JkF4YTGHc+qtyw8xnueqBR19CighQ0zjtv1FkBDPRmlEzsO5LsaLjOXyc67SfEk=
X-Received: by 2002:a05:6512:1252:b0:542:29e5:7324 with SMTP id
 2adb3069b0e04-5439c22a7eemr15260664e87.11.1738015649385; Mon, 27 Jan 2025
 14:07:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com> <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
In-Reply-To: <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jan 2025 16:07:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
X-Gm-Features: AWEUYZneMk8SKNENoCxtqqf8TN4dg0bybmCmFT7bi8kCBXKEBzfRsn05Enmjrss
Message-ID: <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82025=E5=B9=B41=E6=9C=8823=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=8811:01=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> > The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
> > complete, but in reality it's not the case. It also incorrectly
> > indicates that Hardware Cache Initialization is supported. This new
> > compatible string allows warning about this broken feature that cannot
> > be detected at runtime.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++++++=
++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> > b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> > index
> > 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8d2c7=
328b6b81f9b
> > 100644
> > --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> > +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> > @@ -19,7 +19,12 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    const: mti,mips-cm
> > +    oneOf:
> > +      - const: mti,mips-cm
> > +      - const: mobileye,eyeq6-cm
> > +        description:
> > +          On EyeQ6 the HCI (Hardware Cache Initialization) information=
 for
> > +          the L2 cache in multi-cluster configuration is broken.
> >
> >    reg:
> >      description:
> > @@ -44,4 +49,9 @@ examples:
> >        compatible =3D "mti,mips-cm";
> >        reg =3D <0x1bde8000 0x8000>;
> >      };
> > +
> > +  - |
> > +    coherency-manager {
> > +      compatible =3D "mobileye,eyeq6-cm";
>
> I think =E2=80=9Cmobileye,eyeq6-cm=E2=80=9D, =E2=80=9Cmti,mips-cm=E2=80=
=9D would describe the hardware better as eyeq6=E2=80=99s CM is just a spec=
ial variant of mips-cm.

Is s/w that only understands =E2=80=9Cmti,mips-cm=E2=80=9D useful on eyeq6 =
chip? If
so, I agree. If not, then a fallback compatible is not useful.

Rob

