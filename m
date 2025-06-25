Return-Path: <linux-mips+bounces-9496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459FAE79EC
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 10:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7E917EEFB
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E190A214801;
	Wed, 25 Jun 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdS7URZA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A51FCFF8;
	Wed, 25 Jun 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839688; cv=none; b=pcXiIANpaEkitvmoKoo5JhzR9gCSmlzd6SsG7JbVO0CHGSSpwLVvCjcccWgXUWthQUykkPIRpE/SYMl+NV8g2OCb2jAdTThmS45oMWsOLU/UeFn3VHwrBPxbV+Bph8JlwinN9WkzI575sULEC5HqTgpjeTdnrLaQL/BzLhG1MNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839688; c=relaxed/simple;
	bh=4Fi1umREdlDOQdDLgn0mmeLxEGK6c3tzYwdF7w69/tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5BFgYKdCdzDWJHoGgyIWy2M/cA7dtFkYtIVfKdMDFXlzaGhfNsY9/G+LknzEPob7zaRP5jIOYvOhq8vraJNIodBTK9t6acpV7ZUtmJNQurEBe4loVpoyt0WILDMcYhD4ad9SRgkytmvLWGBgG+mdO3TObE9t0DftYW7MTAVulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdS7URZA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso556116b3a.1;
        Wed, 25 Jun 2025 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750839686; x=1751444486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJnvsQsdOKeGYzhsaKnsaGkozdyAaeIBqEamabj2aog=;
        b=PdS7URZAdTOkRKN+ji33rNWhyYVAcoO9ihJLriLYyzrqOMqIUesyssJf9/zo0YtN3i
         AN+74FIh5UmpfS/qYm1U+SmbDxYn3ZLzftYXANnbKI4VSS0UV4hqUU4CDO8fEiWqOKwn
         GJ5oWGt2EdcIsX4sKojKds2fjRtnOQpAg4gghSuhDhCfwT9yM+4mJaTVzng+6DxoT0HW
         91ulo/omXc7SufpeFlEuVD28F1pXTkDhdCdTKVG6380Gnreyo3Pt2ICaOf9izfm3KwlZ
         1fATOYfzdhEGD3mStdEXdOPrBwQHm/5sF03jeVTWD0LNle2G6brV5ATcPAk2NHf1QICO
         Yjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839686; x=1751444486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJnvsQsdOKeGYzhsaKnsaGkozdyAaeIBqEamabj2aog=;
        b=Me2R5LGePo5URrLuRu7+XNld+hsMiaXWIlyK0GT/8F/BuG7EVHwIpiWyR3BTHFnZxx
         3q9/k2VIg4muNf7vvGyEGWp7Fk3FjcvFzY5qWqqD0ouisX2JOKENIoi5TV787wwvqbdm
         GoEK9dwQXyO7XY0XCA3kdfYhFLUvA572gVGQL8dS5bojTVOyhmYIPwg8OYO7CP4mTVfS
         DBjBo2pdU7KfOlhqRmOwHA2VhkxC1QnUy6tBDDqP7h+9k1cDImZNj6pA4ZEmMBBvUyQ7
         9oHf56HFKaamrabZticBqxqWWvnSQQ/urQEEtfUthRiImF0P02vAdJPPXl4gLop9+Zto
         aNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfc1rkM+xcE3Vge8/3D97bb9uoM06sTFWXMRWOqsnRkVRKXIoA/WBNjJ0Xy2djeAwztn45iy81qPWU@vger.kernel.org
X-Gm-Message-State: AOJu0YySlLhJPgI0UHMUgFE8tPQzTS0EgBPX1h+t5f1jiz0flSXz6/6M
	5Ik4r3CbikcUgoP0Ksf/uLahMKgL2uDhpgodul1UORiAtAmPYpN0jklcd4AY0f1Fjwv5AA/LXAi
	dMZ0CP6h2bXseUOmSpZxIU69TJpl0FmROAw==
X-Gm-Gg: ASbGncvv7hjupWkbfJHlGdYynwo/Rtp9cvekJnTKu9zyK1Bh5YjBbeJMjESqzXMlDvI
	IS7I3qGBD/cKERYVnCqwFQUEQqwqPC6svSUyVPosmQCTCUs5En2jhowBgYwc+2N/rw4E8DgKupI
	AJxeu59bKiW8Im4fwdEiHjADpStfliBc2uFZUtcgKKMNQQrx2yRZc=
X-Google-Smtp-Source: AGHT+IE9oHnXo+HjalJsSwX/n73PZusgLHIHEbjGa5OZs8nStng2GePXZXOYAALrqEezCyvt0gmuhxtCoYHPnY1MNkc=
X-Received: by 2002:a17:90a:10cf:b0:315:f6d6:d29c with SMTP id
 98e67ed59e1d1-315f6d6d2c4mr1862546a91.15.1750839685814; Wed, 25 Jun 2025
 01:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624115810.37851-1-ezra@easyb.ch> <20250624115810.37851-2-ezra@easyb.ch>
In-Reply-To: <20250624115810.37851-2-ezra@easyb.ch>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 25 Jun 2025 10:21:14 +0200
X-Gm-Features: AX0GCFsKENKc9FB4uEfCrFZFhzqe3mxFhRzlDQVWogTP1g04PA7noGHAE9IJhDs
Message-ID: <CAMhs-H_8m_zJguMiWae_oRrUhqPu5vh_JkeikJy3nJKUL7yTmA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Reto Schneider <reto.schneider@husqvarnagroup.com>, 
	Rob Herring <robh@kernel.org>, Stefan Roese <sr@denx.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 1:58=E2=80=AFPM Ezra Buehler <ezra@easyb.ch> wrote:
>
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>
> As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
> used for both SoCs. To prevent "Kernel panic - not syncing: unable to
> get CPU clock, err=3D-2" and allow an MT7688-based board to boot, the
> following must be allowed:
>
>     compatible =3D "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> ---
>  .../bindings/clock/mediatek,mtmips-sysc.yaml  | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

