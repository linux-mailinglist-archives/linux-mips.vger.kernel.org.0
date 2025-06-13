Return-Path: <linux-mips+bounces-9282-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17277AD8BEB
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 14:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37EDE18956FD
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 12:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BAC2DECB4;
	Fri, 13 Jun 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="y0Whu77P"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D72DA756
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817295; cv=none; b=HLCipntBibbMNqz/XSb5F6F96q5Z8qGqDF19IDm1fyffDLTMs5QRy+16hWzVsf3H9bZJp+jGvbooF3ez2SNWdoFaJDCErz1+LVpfOQUg07KNHfSOVPtzk+tdlzXtpqBR8N/zl8S1bjxXqkV45b2HsBV0/RC1TX9yVVodJHwSTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817295; c=relaxed/simple;
	bh=yOksK12x1AlO8V3T/bzxnZONHkpF26TWWXCg1vFh0AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rt0juqG2C8qpY63Ayj8ijCVu4T3dgpPc4t1MKx7KElhFD7I6czldCwvCRZtD08CQ6myR6lXh+4H0OEntcFGsWenvc8s85pXtzpfXvXHE3TXx6XqTQFS1NpdJ67I3uDPIJK4Q4K9Eba8lEAOLhIy1knRHemSxJK+PNOKM4+wdJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=y0Whu77P; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e77831d68so19747867b3.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749817293; x=1750422093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxpYkSjpDaS21ypaSUPraaIZX6LF+Fzy1Hk714g/a6Q=;
        b=y0Whu77PWFpgUh7lUuDEl0QzrmMraNHmJ7s8kkI1bnc03APnWfoVqsL0kCQPSKi70+
         7Xg/vhUFZEN7thWuf052ZXQUR95yWVU8C3fyi788zJL+VQNTBjlhrs78KB6F/th9AFvy
         Yx1ASLWjrFpJKFN97AgUQFTkKVedjNVdLfTNuFT+lrNf6Rrx05nCiUU0qSmflp39Lo5X
         hHcvRdShIOVxNxJNpb+xiaC2o6zvDYDr9zqezYylIePNtXxU/t7YPeoGJ5WS6xvWME9P
         TPO96Opczw/9H8YhuqXqtRywiL0qSu2gLCB2+ZoYF3QB+yDgadLP+8lWHV0tKIMRTD/p
         oisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817293; x=1750422093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxpYkSjpDaS21ypaSUPraaIZX6LF+Fzy1Hk714g/a6Q=;
        b=RMYernZuy116uYoAEQTJVDBmgEnLJCI1Jxq9U4w886nE3k+q6bDQluyYoVD27a05t+
         Az73L4mHTtZyV4MYMc3+2GRAxkVMWEN7QwloRGsPb+7wLIo2BZPTWwDyJu8EpA0i/hrw
         6gZ+OO2f343m/dAWWo4+PN1ec2WWrCEUQYdvfx7qx8XDfiGATWhzo00OWu6SzjOlbE5X
         9D6dZL+89NTnmogIIZgYL1uRwJ8gpO9M9ZI4emRup4U71wHLHv17o+wnJD5KChQ8elKb
         qV5ib6S1dHlHON27LFMas3joBXz3vhk7kD//dy1E7XZQdzmPfc866fXad9Bzvt4EQCTH
         0jow==
X-Forwarded-Encrypted: i=1; AJvYcCWLBCW6UMh0YIh/biRiCuaJrA+U1kcEnolYgAmYNAHRDGChWjv2jZXKbE5i5CLDf9GamxYqBDXFqvnV@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZQFwUk6KF4GGTeA8XC9FH+NEcWxh6gLsvTFpWKvM6AJUbpwl
	0DHS+ui/B4o3rCp320J/pFUMgyDPS/K93cFSRf0wcIsyaCbRMpXAd4cBr3ru3zVsMwc+rUBXYxI
	kCFHQoE51FujX1qrj/2XJwf3rX9e7BlRJWI6mS7PTpreQu+HHaHBJ5yk=
X-Gm-Gg: ASbGnctv8+TD3Aheys2AGpQvykXyiUXp6EfsI40rDOy16xGLBf95FfG/aOc04BACshs
	R09z7jH6cwI/nrU6Ic2C1HUvtGFoQYSKss+CTJyr9LQnlOCWvyO9U3yDBI7u/8DjKc+fcjml8r8
	Ye4Tj9kxTqy4AmkPA9d3nmn66c1NzNS1knWsoKpcW2RY9qVXCIZvaXrMJCkAs1zkn/BVzgYQYX
X-Google-Smtp-Source: AGHT+IF2ybUqPH0xSiqDkaFaYhKK7ZzLxSdQSSoAzlzJE8FEafW3KYKiQJ/uSd/ShSbF4cj0aq9bci38QPifMBhzXxs=
X-Received: by 2002:a05:690c:6e03:b0:70c:90af:154 with SMTP id
 00721157ae682-711637a827emr42292137b3.20.1749817293423; Fri, 13 Jun 2025
 05:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-2-ezra@easyb.ch>
 <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org> <CAM1KZSkcc8wh7yuJ-26ASKSehjWfD_QGs0JrKOWm+WMfXiY+DA@mail.gmail.com>
 <9a23e0e5-f48c-41a9-8e15-69cdfbc7eca2@kernel.org>
In-Reply-To: <9a23e0e5-f48c-41a9-8e15-69cdfbc7eca2@kernel.org>
From: Ezra Buehler <ezra@easyb.ch>
Date: Fri, 13 Jun 2025 14:20:56 +0200
X-Gm-Features: AX0GCFsR7GrCp3YbTM9hBEPE8tbF9CwOAORsCaaBIrgaTljF8Q1noHv2JUBBmhc
Message-ID: <CAM1KZSkKUYcsx_gpvtEaz7hoT-KfJmQ0xHeFYEGMSZ7FEBDyjA@mail.gmail.com>
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

On Fri, Jun 13, 2025 at 2:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Not sure what you propose here, but just in case: devices need specific
> compatibles.

Something like this

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index 9db73fcac522..7ce9acec3a01 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -48,11 +48,9 @@ static const char *clk_cpu(int *idx)
                *idx =3D 2;
                return "ralink,mt7620-sysc";
        case MT762X_SOC_MT7628AN:
-               *idx =3D 1;
-               return "ralink,mt7628-sysc";
        case MT762X_SOC_MT7688:
                *idx =3D 1;
-               return "ralink,mt7688-sysc";
+               return "ralink,mt7628-sysc";
        default:
                *idx =3D -1;
                return "invalid";

while leaving mt7628a.dtsi as it is, resolves the issue.

Is this not an option?

Cheers,
Ezra

