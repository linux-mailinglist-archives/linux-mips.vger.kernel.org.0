Return-Path: <linux-mips+bounces-6764-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B40399D0203
	for <lists+linux-mips@lfdr.de>; Sun, 17 Nov 2024 05:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D150B2226F
	for <lists+linux-mips@lfdr.de>; Sun, 17 Nov 2024 04:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4E011712;
	Sun, 17 Nov 2024 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak5FtGJs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19238C;
	Sun, 17 Nov 2024 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731819047; cv=none; b=aH4TfwqpnTQ9QUzvTh5P42eH3zhYQqXrH6STfho59O2adbj9L0AZWaFHrmD4e93s1ttY/h9ZbHCoOeKNes68jEkBdKTG501rQMRAeySJTs2b1LhxERbWfLXkCYrU1O6o8kGxKZ7Jzvx4cHSSKW2VwOzL2jnJLgu6t6YQlx8oLio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731819047; c=relaxed/simple;
	bh=B5UX2dPu40heJ0iCllXPhs/0hs5Z8kdO9tPQmVbbwoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jI9guz2Up9aarMpCDocfkEragdDZXQ1C8Pof8rxefw87z0ZFPrpJSH8KGq2nRQW1OnOD2U3EXbR/EtZRvUesH4vplXqu2ub32e8SVwfYZMsmrYYqLW+HuTLyaAaPXu1FPBmlKk7Rrdcw8hV5dH+4p6n7lvqGkNI64R7ZGHy/PoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak5FtGJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75E7C4AF09;
	Sun, 17 Nov 2024 04:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731819046;
	bh=B5UX2dPu40heJ0iCllXPhs/0hs5Z8kdO9tPQmVbbwoU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ak5FtGJsN0jAxPQUuvBC1i4O+/n4vQ2pIfeR5bFJeU3ae6pSLPH+uKt5w+8D2TWZo
	 mZDZ5qPtgA9cJO1hTGuc8A62HpyXJ3QSKQ4GXRMWw9Uuda1Z44EuzOxq3teV8uwfkJ
	 OGsTtOz9UxPzEQPfkT+qmVJ5iLcet+9odFqu0NwczGykwGsDxxToCKaKO0wvMcTjUH
	 KOlj9FH09CjL2epc1/3cFZoTw7LxnoIkL+e8d9BLJVf5F6T2oqZzHfjrtz4bomEeAf
	 a63QCWW9GTNib17tfjVt3mhDIamKOblVV9Q8wC2BHFfpGDRzUrQ+Plz3upZed1WAmp
	 FLIWUHrKvVmpQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so29615341fa.1;
        Sat, 16 Nov 2024 20:50:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDabzFaOmJa0LFb6OumeST2mECLI1RH8DA5b1DsvX6kfUGeBZXIb7sgPYf5f5hklXsrnn3D+/pyOVW2Ic=@vger.kernel.org, AJvYcCVvMyUA3E+1SbDSRkwlYb9qPkY+dc8SsCwf7ohNXxYV+Qw/D5ZMU1pwTD1KX/I8yqekjb7E5ChT1u8ojA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Q9fxfrz7UM8ayHLwjO9Bi3OFRxUNjoW+wH7WOVr1oxRJMaCc
	WRXZ+k2SrhRmYUjCfGufO+u/z4oLgcsCCsN1uUrhRi6sYY3IUSZwsdo6MrmhGISoaAZMuVge8+V
	7eeRuKXhXKuQir7J63RJLAAHbMno=
X-Google-Smtp-Source: AGHT+IEHF6PBnTNhNZonYLSct7kQ2AhVw6isEz+vB4uwjps40r+GD4pRtRyGjMjpnmVX1BCuW90QM99EMngQ08mX3wQ=
X-Received: by 2002:a05:6512:2245:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53dab3b9a90mr3414992e87.41.1731819045604; Sat, 16 Nov 2024
 20:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113064028.2795128-1-xur@google.com>
In-Reply-To: <20241113064028.2795128-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 17 Nov 2024 13:50:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSpM2hh2=Wgribb92nHF5_peRb+gxdO1Bt1MkeL8N+hw@mail.gmail.com>
Message-ID: <CAK7LNAQSpM2hh2=Wgribb92nHF5_peRb+gxdO1Bt1MkeL8N+hw@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
To: Rong Xu <xur@google.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Klara Modin <klarasmodin@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 3:40=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> The _stext symbol is intended to reference the start of the text section.
> However, it currently relies on a fragile link order because the existing
> EXPORT(_stext) resides within the .text section, which is not guaranteed
> to be placed first.
>
> Move the _stext definition to the linker script to enforce an explicit
> ordering.
>
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> --

Applied to linux-kbuild.
(inserted before "vmlinux.lds.h: Adjust symbol ordering in text output sect=
ion")

Thanks.



--
Best Regards
Masahiro Yamada

