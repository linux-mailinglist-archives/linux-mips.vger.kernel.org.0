Return-Path: <linux-mips+bounces-9286-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16597AD8CA1
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 14:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE0471E255D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 12:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FF41CFBC;
	Fri, 13 Jun 2025 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="G7EMkuUj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F31CAA4
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819419; cv=none; b=VDWQu6MlcVITQ1ppoSSeU753VnGiWvQQqpwQoke7v+nptj7x1k7W33xHegMeNvv+kRow884WWOzsoUx9oPTtjAkfKL/dzr0sW2lPyDQmVvT304b6zjTekNZ/HYUUJ9QgugkLQR53r/bAaomAI6pIOB2HBucoWg/usmy7NSUDJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819419; c=relaxed/simple;
	bh=aE22SOQvZ4NboRw+vhfJKx6DgFaydjXtrHMM6GlB71A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndciC9Y7yyItnKIsicibgBa7F8PEU1B0Fz7AM4NMY4SizSpsvGeP+HPCF73t7c83J0bLTP9XBNwHriav2Awtax1l0YdjI3LnCzDq79RZUlXoGc/FZHbRPo3VZ+A3musbtoAfG/thyx67QaVSIMPe2QfVAdmv3BJ+aG0WWQ/X2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=G7EMkuUj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70f147b5a52so14641527b3.3
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749819415; x=1750424215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aE22SOQvZ4NboRw+vhfJKx6DgFaydjXtrHMM6GlB71A=;
        b=G7EMkuUjg83aQqNVAMTRIX8+gssFDXPDydUJjjGRBcYHPpul6nFNmWi0zekcMZDr5Q
         XWSphwPFhx/LIXTul8MnttqQ15XTsLJ2OoHUM3SPx4psJg8W2SaL5YJIsOqhBa7Eh1yF
         p+0UeEbrXTtFCuw7TcjAEx/6tNQQcsQ9GG+JYDfCm0ryNjp9veLXpjp5zpYmAYBGKFIx
         LpwbBgZfUHbVwEG33j3K2RnAkHpeIDT5ieBGrN59G77JJwWY4rNaO5ChSwH0q6LKDIVy
         M9IVC3quztfvL/8hqixvDUGDrMIzVzrlPxgZpWslCSxI92DcSQuewHFpfksqqLysA1hW
         /rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819415; x=1750424215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aE22SOQvZ4NboRw+vhfJKx6DgFaydjXtrHMM6GlB71A=;
        b=Y14OfxdLzSaFuE+U+UA+JnMvwPqKgGPCAMbDMJPU/rAD8GkMig/L8h47wW4AyNE3yg
         gK7/D/9Ln0/oBLqbMEtnr+fGtaNyhTfI3ljB74V71BCVStZkmjtRXvcUFI2kgi9btrFY
         IjARm5ZdH57Cr2gxHYymEQDp2+nYutUwyiI0Gmd3jx0Nw4eFsvwEHyid2t+zq+6otRHj
         cKV+6Xf+CW8UHEc6f5chpbkSdc7CHHkLMi4z3tp4UbD1DpVPBdom/FEPrhNW9ZtPO8Kh
         R9+x5zRto0Nwa5Z+XFZFc4u6q5M2bj7pRyR3OCQP0dDViy8fcdPvQazP3dgSushbzJhb
         Yh3w==
X-Forwarded-Encrypted: i=1; AJvYcCVS2G4k4lBTEPWhsUz26huj/zgs/908xk/o2duIHG6qn3XdV3hyRZ7zNhOLBYjV50KuwdNB+3yI571g@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8RJrRzN6g+0PMhSWNBMNccuhQssFCIV9rDm5Yy2afVZHFvvB
	hnqCZDWXaX2QZNlSXihdT44VcxD2Cv8H/ZYuPDtdPSsLCozbP1rUe1jW6mmFVLxLkrpISk4DACA
	+5hrLCZNeRHOnFxV96Ao/WoyMpIRcjCgfvxCm36Ad5A==
X-Gm-Gg: ASbGncuGqwxYLB/UOwG+0c7jyzWF89fLDlEB+p0JxdkkOSMCg3wFEU3JCPSrvNnBrxm
	h4IYICp8AJUZz8mhYwTbXZaXlg15XNz122k/FWubP6w4iJ7Vt6Ltvc0wjxh7ebo5HqAt4qBiOmd
	HbYifoz9q6lI+bLRrS1j/DaWrHTVSOTnXzE7L/lBPZyjjD9estzrDvLMApVxI8VtCdoU32hIgo
X-Google-Smtp-Source: AGHT+IFYgeldfZwYp3BHb1tpuFBy5VB45y2nB1s8q+rJkQPG+XygN84yNhBbrR/75HnxNyXPI4/9cR1MA7nbO+1HRlI=
X-Received: by 2002:a05:690c:46ca:b0:710:e4c4:a938 with SMTP id
 00721157ae682-711638009d6mr43312777b3.38.1749819415623; Fri, 13 Jun 2025
 05:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-2-ezra@easyb.ch>
 <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org> <CAM1KZSkcc8wh7yuJ-26ASKSehjWfD_QGs0JrKOWm+WMfXiY+DA@mail.gmail.com>
 <9a23e0e5-f48c-41a9-8e15-69cdfbc7eca2@kernel.org> <CAM1KZSkKUYcsx_gpvtEaz7hoT-KfJmQ0xHeFYEGMSZ7FEBDyjA@mail.gmail.com>
 <2ca2da8f-92b9-475f-aa41-bd54a95bfc69@kernel.org>
In-Reply-To: <2ca2da8f-92b9-475f-aa41-bd54a95bfc69@kernel.org>
From: Ezra Buehler <ezra@easyb.ch>
Date: Fri, 13 Jun 2025 14:56:19 +0200
X-Gm-Features: AX0GCFs0wH48KYSiwteC0kCsIqGsw_UEw1jb3xtZM9hqtvaV-ZBcyYvNeV2wYxE
Message-ID: <CAM1KZSmLwLopU8rVrPS+wFqAGZn-7LdsikEg6p2f93EiK9_2_Q@mail.gmail.com>
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

On Fri, Jun 13, 2025 at 2:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> That's not a binding, but driver, so obviously it is fine since you are
> not removing it from bindings.

And, if we also remove all occurrences of "ralink,mt7688-sysc" from the
code, as it is not needed from a technical standpoint, can we remove it
from mediatek,mtmips-sysc.yaml or is there no going back?

Cheers,
Ezra.

