Return-Path: <linux-mips+bounces-7478-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91446A13736
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2354C3A76D4
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 10:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E7D1B4F0C;
	Thu, 16 Jan 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS6mgmmh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4D19259A;
	Thu, 16 Jan 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021650; cv=none; b=leAanNO5hvccmgTJjExMEox9aAj6ojPMrSPDqVN597F2IEfcl8KdPOJCDOMWLyOFNixrhUYMhMIpxwERCd/GkJDtmAs6zCAe8ThoAJl996vBtBYdXYT++tEAeSvACz7ZyU1G3V3zpq4DxDa8v+xgLAbY6sOOQqadfGFaEcS1m0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021650; c=relaxed/simple;
	bh=T1clT+tkQfHyxLqH7NR/oTJ5tD4DWz9XrXwkoWRewtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VX+NVnnfZtIahaQ0vDAgpeHGHEkFz0p6zGvnrDGUSr1rOLUAMGohQqoKDqQ/0vPfU+ZhBCCvLTK4m/kwASFkGXkWQ0eEHNi3B5MgLGo74PG5Cc3HlAYW8WrI539eBRCTFgas+OCTP5I0TtY4l5QDfc+/1QsrgFbcoOyhs7ThaFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS6mgmmh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso1018015a91.2;
        Thu, 16 Jan 2025 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737021648; x=1737626448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwjyG4g1AOZ0S1HGev8FASv1raVOMwcGZafYv3qAFLc=;
        b=NS6mgmmhamrRuGuyui8HF7HOMa0rVg9hf2bEhzHy9IeIEYq/H+7mwrzWY6PDDL5dEE
         HqF05VspyO+poFY/oHQSACYK8zemNiivnOSzgWCzZu1WB/EenhMWkdg7Kp/SZBggf+gq
         2uyCDjDhGnMJ5/DIKDNnxpLTy7dWfPQwOY5jJh7+16b962JSGoj7Wnj6ki34GrGNU6Zw
         876ejI5hV1zpyqRI5PtiGTJf8KxuifnN3TG4IpwuJ6fzcX+xSYuJQHuWbVsVuCtwyQtk
         cVs/tDGo9YENhwJZcG+MuR7ObAq/j8rLl7C0eBWPjpXzdO5uuBjfbpjUnhdJyM+amCO3
         cc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021648; x=1737626448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwjyG4g1AOZ0S1HGev8FASv1raVOMwcGZafYv3qAFLc=;
        b=R3ogh69UDpiyAIFaJLSnQR5sCFj3QB+rva0LD4eLZDufQnTbQxGYbRD0jYa4wlXwsQ
         ujVBCa48T3ORWTUP1c/7EmAjUfnxhA/qinpUxtAvSOmYtYPaiph982pEm1OQe3Yx3kAm
         NUsqGaAYfICobwZVZ0q4ClFWIczmBDlHmDKVHpM1Q3WzBqulk1M3Ckbz23Z1Jdlx4omC
         hR4DMFCsFT4n0x+ay9jNhYHp4ld/IYJwjwvqY/61xj6ctGYLdNAjRILWDZpYFioGQvmr
         +sMLOa8OJhOpXP8Hha5JBvC+Nn0jeQ/4aUlUAvsvTf3V+4zBPA1LyD31HBvZ9cjOC87g
         DbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqI8vb0+BBrc/msVBgx3KNQ3S4FoNBGWXQbQdjWuR+BtfS6ohhBMxz0sLsone0HUlMRTZsae532sHMlg==@vger.kernel.org, AJvYcCXhCu56uSPRdrvAtZley4jWeJUYeTgwT1qZdp4QClHSWzmt8+yazJ4FH8Z6BO7o3cUMjslK1D0SkG8o@vger.kernel.org, AJvYcCXxH5hhIlPY2o5wQq8Hc1h1+RuYvOv/vUryeOQ59RZUW++K1nI+zqDDptq4HqKWtPZiPKf9DLcfM/LkS25n@vger.kernel.org
X-Gm-Message-State: AOJu0YzdlHGTQHxFW7INh3E8Z+k8cXHiHddupyoXOgCyk7D2CLjT+CDl
	koLHLvlL7z6HiNYnoJWtlRAXo+vagBa/cE64Bn4AJ9OrY/xK5KHY2L0CX4CrFYA8QNh8/HzMF43
	TM+UUDfGIBpXcigd4DakjdG59nPw=
X-Gm-Gg: ASbGncv8CzY9XX6lahOXnMy2pbOVU0d2tWpu/JaIS7hsVR5gxGAROdSfn//ZA+pjVmJ
	CvIalygKIYABcTKOgPOGoydhS4lg4aHSMCVWz
X-Google-Smtp-Source: AGHT+IHwWQIZt9DV37UXV90sLCTc9eg+a3xkPOegZu1r6vJM4bmS6oPT4qfE36UWvz+69HnxKYV9L60Cr1cARLyu1wE=
X-Received: by 2002:a17:90b:2b87:b0:2ee:8031:cdbc with SMTP id
 98e67ed59e1d1-2f548f1ec3fmr39504561a91.23.1737021648560; Thu, 16 Jan 2025
 02:00:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
 <20250115153019.407646-3-sergio.paracuellos@gmail.com> <1d6833ba-3bf5-44a6-a5e3-6bef76fd640b@kernel.org>
In-Reply-To: <1d6833ba-3bf5-44a6-a5e3-6bef76fd640b@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 16 Jan 2025 11:00:36 +0100
X-Gm-Features: AbW1kva7dPb1EwKXo0Y4F2rt0ZT_PFkgUwsonCGMglfpdISHF2V87Trw9vtgwjk
Message-ID: <CAMhs-H9Kr8YFkSGJE-1E-wy=Fx5NAL=tLLCUaGT2AYZjUO0VEQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] mips: dts: ralink: rt2880: update system controller
 node and its consumers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 10:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 15/01/2025 16:30, Sergio Paracuellos wrote:
> > Current RT2880 device tree file is out of date and must be merged with =
real
> > device tree file used in openWRT project [0]. As a first iteration for =
this
>
> No, that's not the reason. Whatever forks have, is their problem. The
> reason is that you are improving or adding here missing bits but each
> bit must be justified. Again: whatever is in OpenWRT is not
> justification. Justification is that device is like this, SoC is like
> that or DTS is written not according to bindings.

Ok, I will clarify that the DTs is not currently written according to bindi=
ngs.

>
> > changes, align the current file with the needed changes for system cont=
roller
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597

I did not want to cut the hash and commit message for the driver
submission so this line become a bit longer than
usual. But other times with warning messages or message lines like
this I thought readability was preferred to match
width for the message itself... Am I wrong?

>
> > from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS=
 SoCs")'.
>
> Use proper commit syntax. '' are wrong, missing commit word.

Checkpatch only complained if no start and end single quotes are
present so I thought the 'commit' message word was not
necessary. Will add it, thanks.

>
> >
> > [0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/d=
ts/rt2880.dtsi
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/boot/dts/ralink/rt2880.dtsi | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/mips/boot/dts/ralink/rt2880.dtsi b/arch/mips/boot/dts=
/ralink/rt2880.dtsi
> > index 8fc1987d9063..1f2ea3434324 100644
> > --- a/arch/mips/boot/dts/ralink/rt2880.dtsi
> > +++ b/arch/mips/boot/dts/ralink/rt2880.dtsi
> > @@ -1,4 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > +#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
> > +
> >  / {
> >       #address-cells =3D <1>;
> >       #size-cells =3D <1>;
> > @@ -25,9 +27,11 @@ palmbus@300000 {
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >
> > -             sysc@0 {
> > -                     compatible =3D "ralink,rt2880-sysc";
> > +             sysc: syscon@0 {
> > +                     compatible =3D "ralink,rt2880-sysc", "syscon";
> >                       reg =3D <0x0 0x100>;
> > +                     #clock-cells =3D <1>;
> > +                     #reset-cells =3D <1>;
>
> Nothing from here is explained in commit msg. Why this is suddenly clock
> and reset controller?

To match current binding, will add this too to the commit message.

>
> >               };
> >
>
>
> Best regards,
> Krzysztof

Thanks,
    Sergio Paracuellos

