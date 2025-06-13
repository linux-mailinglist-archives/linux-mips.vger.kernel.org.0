Return-Path: <linux-mips+bounces-9297-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC80AD93DE
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 19:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BBDA7AEB99
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 17:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB27C226CF5;
	Fri, 13 Jun 2025 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="He9DMiq6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4C22068B
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749836412; cv=none; b=qgcl9vbKw9pit4+7ryrNKvFKp8G0GF0dwggFH+fzKBhezI4QISvP2pRV6g5VSOLcwZNvTj2KlOxSZlID1UdL2EbLHNDgbzv36pq5HpL9THpKv+k2IfmWW6LYvks7R1vU9RSRq9ggcxYRUeRJzDYc18P2bbxvgJmF5ul9Z+ZS+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749836412; c=relaxed/simple;
	bh=l6ecEMsyxuv6xVsQtPMXtenqzA5XL/ctwXGAyzR5dVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AK1PhA8xiDXnK6F4OY65RtCYCi9or6HHY1X71YNC7B12HYp7i6Jg0a/EgqzYTpNPczdPJf6Q+z3Tr1c1VJ5UL3zIFMAGIEZCHsk+NZKMkbM8tGElIvAb34/ITygL3Sii76iSvS3XRLAte7kpYmvJn/9Ah6HFuY11E6t5W6AISls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=He9DMiq6; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e102eada9so23167487b3.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749836409; x=1750441209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6ecEMsyxuv6xVsQtPMXtenqzA5XL/ctwXGAyzR5dVQ=;
        b=He9DMiq6Jvn2pZlTCwU6VCza2YTaOD/iNsWm8WLBcc9y8SUmVAkb6Zq9S0bDkqn8le
         iE/Ae9l6weBHQULZimyAPVnOjM/r3BrnrVf0xuSYNtNVRK9mffbh2KODQS5ZdribASBM
         IKBksSxity6y4Wi8oTEdHSJp1RqLJD/DSpXeVKwFri+1Y/55YegnrZDN6LbT8wtv0Ds/
         qfsFzy5t2a6e36WYCkdA0kWqXjafUsFoOQIJg9Ky+RFc6wQD9T46vbWHvCEgDtBeXKW5
         +uUcYd/wqBc0q3lo5ZqrcWPAwE5IeUxeiNTSFgjCBsUJJ2Qz2kB3V6r5KoZkUJWnn0vr
         nz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749836409; x=1750441209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6ecEMsyxuv6xVsQtPMXtenqzA5XL/ctwXGAyzR5dVQ=;
        b=KvrgG4lGYa73R1Sc9OeIpWSRmd4rrxfQ6/V43qD/PHMVonwv3QbMvmrsKoRrvUlQcX
         ntDG4NtBbTS7XpnwJy3pyFbU0wTu7LBVU2Sx25CqipMKACfJwywiqfG0Mk1kcFx04wG0
         VJtPiYS7ii5y63cq2p5ibAqiTBMdWuLKBBajlg/G8n7ShkU/2U8Em4P7EKNBWCgkdX6I
         zkCOIevgX00GnttVuglYmqT1nGdkBXCG/1yT8GWvmCP2J9sGTMT3el8Ah71aNc1gAmkJ
         BRXFSM7EnQUMv+8RojlPlQwJd1q8SkxBesKs3cRz++wtYPZmfYq6tLe088U38651zQ+o
         v8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVy3xjB4k8hGvHH4C0igrahrT2KMIeF0H1Kp+6+2teDebxQ1hzSO5Y16emzEu5fJ6JQTrjATyXPGE74@vger.kernel.org
X-Gm-Message-State: AOJu0YyvPDV0+mjGbC7bq3AocS89uAyuc7JJHEzoxhTsLLHLmDO77giq
	5jt1eRtCg8KtvgSA1bO3kIkCw5SMoUwMDYeTVlmZqVrke9lBW1tnVNY86r9dYqUuR99bKSDy88L
	2es9oth7MLwVqt3mVCfty+VUVJfZXWpp8LDVJcGL9FA==
X-Gm-Gg: ASbGnctD6salBI5yj13QkHnSKMiLT0NaOWaiIOkCUV5xBgZ+29ORMXWVR0B3TiaU3Z6
	MakGapCBYaFfhRkVaOX+Pk2I9/kSJPSXW8Ll8xYsECLvMXbjKcffwCWLsSV6AnheHcbphD82H2r
	MHE7TqERla5dT0wcB6KBHjN9RudqB3Z541rakNtHpmicjLUAfk1FDdsJc67h5DNectqeImFR/h
X-Google-Smtp-Source: AGHT+IGiCYDgPMGo1VNu95IQ7PcSLxLoPHnG7oSZm2KeRnwDMVVIz4NBWUyH7AiY+23gnL72vAtSx9i6sUfMpIc1gTc=
X-Received: by 2002:a05:690c:3503:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-711754336f1mr5020727b3.24.1749836409466; Fri, 13 Jun 2025
 10:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-2-ezra@easyb.ch>
 <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org> <CAM1KZSkcc8wh7yuJ-26ASKSehjWfD_QGs0JrKOWm+WMfXiY+DA@mail.gmail.com>
 <9a23e0e5-f48c-41a9-8e15-69cdfbc7eca2@kernel.org> <CAM1KZSkKUYcsx_gpvtEaz7hoT-KfJmQ0xHeFYEGMSZ7FEBDyjA@mail.gmail.com>
 <2ca2da8f-92b9-475f-aa41-bd54a95bfc69@kernel.org> <CAM1KZSmLwLopU8rVrPS+wFqAGZn-7LdsikEg6p2f93EiK9_2_Q@mail.gmail.com>
 <864cd33e-94d4-4ceb-a8dd-1b525f7bbf26@kernel.org>
In-Reply-To: <864cd33e-94d4-4ceb-a8dd-1b525f7bbf26@kernel.org>
From: Ezra Buehler <ezra@easyb.ch>
Date: Fri, 13 Jun 2025 19:39:33 +0200
X-Gm-Features: AX0GCFtIra781Yxn7QR8xhN6tR7r_F_s3ZrzvXNCQAHhdwe7BqBIUmG4N4ipRGY
Message-ID: <CAM1KZSnAKee2UvGbNwaAq7cevpRcnFiCYixHHneafbDRH9+uyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] MIPS: dts: ralink: mt7628a: Fix sysc's compatible
 property for MT7688
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Reto Schneider <reto.schneider@husqvarnagroup.com>, 
	Rob Herring <robh@kernel.org>, Stefan Roese <sr@denx.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 13/06/2025 14:56, Ezra Buehler wrote:
> > On Fri, Jun 13, 2025 at 2:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> That's not a binding, but driver, so obviously it is fine since you ar=
e
> >> not removing it from bindings.
> >
> > And, if we also remove all occurrences of "ralink,mt7688-sysc" from the
> > code, as it is not needed from a technical standpoint, can we remove it
> > from mediatek,mtmips-sysc.yaml or is there no going back?
> But it is needed. MT7688 needs it to fulfill the DT bindings requirement
> (see writing bindings): specific compatible.

I see. In that case, it seems to me that the only reasonable solution is
to adapt the bindings (mediatek,mtmips-sysc.yaml) and go forward with
the initial patch.

Cheers,
Ezra.

