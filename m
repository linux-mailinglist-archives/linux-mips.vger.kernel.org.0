Return-Path: <linux-mips+bounces-9303-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D7AD9A13
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 06:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC9B189BE5C
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 04:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0319B17588;
	Sat, 14 Jun 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw8eiJBX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712112E11B4;
	Sat, 14 Jun 2025 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749876432; cv=none; b=rJqTKOwZXcxoV8ZldY1lYjakM7qJKQfkrUwVOoy4qdm0RNSKbcFKmT7EPfOMPOfLNcD/yhwh80Cz992EO0rHHK+cp5lX2zsNzFn+4ZqqeXlA/PjAjS3cpxFUv7fR/Xk05ZHkhtWoSA4dKyn9upipxKC1XGeI8fAu+Dij+2QH7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749876432; c=relaxed/simple;
	bh=RSPt+Uu2FSeMlrigllTTt3KXr7mlbqrDZ200BINgsfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7uYMO8yJHR4kLsZ6+z+3wleU19qI0BjX3VzunWPG5LR5TT3z8/51oaWdG3iFxWfzaLlKxNz+uL8EI2ohOwZiX/Fezx3vkCraCB9ENUqtUnsV2eW0QdUPc/s47ZXDtt1El+IcgNN/Rv4jSaKvBivQ0vxVEBsF69fZxMcf0Nb85g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw8eiJBX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso39489365ad.3;
        Fri, 13 Jun 2025 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749876431; x=1750481231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqc6FyJdV3CisvXUPTHfafczBwwxWecs/XySOYB+wMU=;
        b=Fw8eiJBXVlHYRrlZtqW/Sxr3BCtMfwuIaHDezSsq0eTgEoBbc2Jl0P/9FJknqHfmsN
         gPla3QF7oIGXKF2OlbRTkfKBjsNeeTQstcUCUIK9TO1Z+Uo7DndoHAwdzyx3Dtqv4nTe
         ZSni4BVwQQBr2YBzK2Sl7YgGPvf/AgZM9pFYifuLBM3L4r+8Ojqf1KIdzKwVrke7hWpK
         zV6LFxFGHyIfIW6GEJBcUwUkhU84NpOOPdPvJiYjWpvQ3zIWaz/baSYZkNC41DVPCzVy
         FPtHvQyPzoBnS0loNte0iScvr7PHOKy6v6ycKdq5rLREesTaKsVawXNnyJgGN2goHmBZ
         XE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749876431; x=1750481231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqc6FyJdV3CisvXUPTHfafczBwwxWecs/XySOYB+wMU=;
        b=SKqKdx0fH9TfvQbblSstPolZOFTZ/DOqXU8yX2TPEKZLgU2Jt4pgMmRuMMAftF4Kti
         FPCY3Aanj5K3LL+pR54cng3yvpTC9QfyMPNXJNe22PASCKiprEl0rgUBk4Y6Vw+E2zAc
         UkBYysvbUYslOoha5bMvaDF53bnsvLW4/9cM1sF8vxBANqAiKDLvHJpNPS6FAWm8stTW
         YBQuqf4rKHJAPL6Rhz2yR3906vvDlUCWJl2ITiKUfcl17aqgPfVXZR+vuQ3LKpeSpkBO
         C1A7tK9+OD3aNn0acXUFGxsQtf2SKxufPm+qzYqSS457D2RWZ4BXoCaHbutDfSNKeR4K
         tBcw==
X-Forwarded-Encrypted: i=1; AJvYcCULjELQrigZnGdEJnFaqb1kBQJvVRCkgJX8CKeFJ6p/qsM5B1NzelQgUh/YW28wQh85M1EnaV2wCOrl@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKciCZCU1RErWBUZLDJwEtSvtnUs/TJZGtc2l5wB27PIqKX1S
	uWuUn20u/GJ4z5+KdQVf53aSZuwO0SeOfcEfKuRZldlECnazYJDhaM5dvbXlaK16FefXKQZs3+7
	0D0ILK1E1u6f1xI2QQJUj1MhaO0vKp+Uvkg==
X-Gm-Gg: ASbGncsHUInG9Pv7VnA7aM5l/EtprV2m55/lV0hZUUTWIRn1CuO8q8otnUvAAG07h+2
	VHwGlEPBQcfArgMLXpTxQzhbmcLRE4m6F/lhlwbotSKT52rOXODAkXoH6GlZ4TTKrf3Pe8kRyu+
	NxnqXDFfRkvJ2KRQrKcabzEXcWLX6dn9Qbd7HBtE4v
X-Google-Smtp-Source: AGHT+IGoQlleDe9oUaqFXf6zpRWthv/spcY6J31GPSaLxuzoN1mwF0c0MeB0Zpnw8rrCHtgVkDdH67s9nXWe7i180LI=
X-Received: by 2002:a17:902:f683:b0:224:24d3:6103 with SMTP id
 d9443c01a7336-2366b3f78b9mr28847455ad.35.1749876430663; Fri, 13 Jun 2025
 21:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-3-ezra@easyb.ch>
In-Reply-To: <20250611194716.302126-3-ezra@easyb.ch>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 14 Jun 2025 06:47:02 +0200
X-Gm-Features: AX0GCFuXlrmVp1Or0vYyvu7dx8wWzndH7zV-_HRArICnUXSAACwqQunQFIvzdms
Message-ID: <CAMhs-H-kQfLC5204WkBstT6uj-gvVjEiGt2AVUM=WbRL0Qp0-A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] MIPS: dts: ralink: mt7628a: Update watchdog node
 according to bindings
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Reto Schneider <reto.schneider@husqvarnagroup.com>, Rob Herring <robh@kernel.org>, 
	Stefan Roese <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:47=E2=80=AFPM Ezra Buehler <ezra@easyb.ch> wrote:
>
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>
> Most notably, add the mediatek,sysctl phandle and remove the redundant
> reset/interrupt-related properties from the watchdog node. This is in
> line with the corresponding devicetree (mt7628an.dtsi) used by the
> OpenWrt project.
>
> This has been tested on the MT7688-based GARDENA smart Gateway.
>
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

