Return-Path: <linux-mips+bounces-12603-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5CDCDE915
	for <lists+linux-mips@lfdr.de>; Fri, 26 Dec 2025 11:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D98CE3006583
	for <lists+linux-mips@lfdr.de>; Fri, 26 Dec 2025 10:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E1A280A51;
	Fri, 26 Dec 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4pAphAH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B78163
	for <linux-mips@vger.kernel.org>; Fri, 26 Dec 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766743445; cv=none; b=Ye5TqcPVFNhW9Fag8vozXPZNixiHuuqm0WavzfE7IuC2DkllUx5jatD54lXSWYXldXIFllVzBnMNluHtWZDqx9pQHio0J81IFiQ4EZSUy1WJYqsOlSuuBk0CTVjpZwATYGakPX+6LbKm2LiVB7q+x5rTaIgPo3KLJE8YtQvkiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766743445; c=relaxed/simple;
	bh=bsPlTRK85fjjyDDqOcgY783Uyn44b4lPb1UUHMFZ/co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvGR1GYl7NWvY5qod4FJ/7RbR7jn9URYhetqK4uLRX78koaWiXf0Oe1drALWqWd+Ijoek2DYT3d4MgHw+32VXBwoce4nFV2ujaISVq352hx++bApPWkJDwdexDOnGjMYNo3kKrWygvgwzd9xbudA+rD1rVGKWdhmUL0DTbWdNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4pAphAH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso7865126e87.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Dec 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766743441; x=1767348241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=F4pAphAHLtPt1+EInHb/X79ez2KY7kAuFDM9wt93bNd1lNSNWQj+qVE0vgK8hRnWHT
         ZJFkPfMqZ7fSeL0GAtpCUdPGMm2bWr9/7XcmEEjHB5LBI3wVsntDxD/h411GwcODFDmk
         6rdSGXWBQCwBVhEzgvSQ9VnYE3ghuTI+tFT+v4MBVzoz4zCzWaf7PNl+JWLVfJfkwPYL
         0Bq7itlnd1N0u/oT4QhAh6Ephwy4TKPlogzrzlPzyptsT3c9wRcFZu0rofat10/a5TOa
         qXiT4jJ3/45iV5hfhnmp0zOtyYIP6IulEq+0qS1CmC/MJV+E/KyFccyhD/3sCyphuzZC
         azAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766743441; x=1767348241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=guV/aMQxuXNLGa9EsppQ8u4rE5G++4hVUbSr6wbBuWPUNTej0BH5N3vrBW0s4Hvg9D
         ktrHQHosroOmn5CBeCNebkPoV5/E90j/8XE87uA8Vxz89XUt7fM2Hc/MxqVF1jflxk0q
         NKuwFTPpLc/ncUUhEAJn51bekWYOwRNzq7gsJlUOmCZPJgTSwHepmjBmSSzA36u5vnye
         kItkK6+vxE5YTIlCUF7/JWeWicNtoiY0r9W3Y4e+STnwDBRDvS4M/kWENDI8srzf/IfU
         69TBUoOJexdhpjK2PX2dJsTxycwibOeFLJQZSKyIykqwPnKnsXjjPkdBZ0wa6EVJM36x
         AWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWowDatEKXzvYn1SKCwrSnl2wskKytJ6ZNNDvkx5yqmlDMFjk8Ga7DE8RKHnvGwXorZaOIf2zZ9rXM4@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzF+ByZydSYYCZYGh/X162YKvqPIe3V1OLLrGRXDOictXPdvd
	GjwjO4I9pkPEhaoCDJJhwQNf7zcEqmCh0c/SRRbGfqAKBWqfT6+Jhi8ytz4xbZBTsVQNuoRC7cQ
	xl1qmZG+p7NLb73k0+unlrSCq6c7VvQc=
X-Gm-Gg: AY/fxX5ynpTGdX0VXwaEX/6cdHl6hFTEMvX8Cfo92O3g9Co0emviHlUjfLmGH0Lwv/9
	bCQbDPYRkNJLDIdptftkUfBIX2O46RWKtu0DyqLqT1r26WTlPRakZFwogiZac0opwutLQwmwuPa
	slkWj4mZIKWMYP5mK3h48ETddXMGKTSd9jOiB7tT1ILWxBZatUWSDm/HdXFe2aXsiwLNpl+QXay
	pWl27eLDaVykMxwTjQ4WIQ4mFW6Mn6XPgriT7tqNnqwu03uavBe23nmQPZ/RHUWD1K9n5BzT147
	N6/eTjk=
X-Google-Smtp-Source: AGHT+IEeJtzsXB++6IhxWCem8I/iqi6tN+vUyXQQj7sGJYC2SPWAV++ictVP2fCKp10Wj5G66giWAcJxanY8UYAXGPk=
X-Received: by 2002:a05:6512:e9a:b0:595:81c1:c57 with SMTP id
 2adb3069b0e04-59a17d1813emr7434587e87.11.1766743441289; Fri, 26 Dec 2025
 02:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1766471839.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 26 Dec 2025 18:03:24 +0800
X-Gm-Features: AQt7F2qiUK1mpU25DWjs_X4oGOorQ76rYhxJTsfWZSC-loYSKF2H28Cd9YxqJXs
Message-ID: <CAJhJPsVMsWmiaghsyvfwGzBOoKR0Tn9gGwaT+tpeW7q+qfZN3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RTC: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set introduces the Loongson-2K0300 RTC, which has a similar
> hardware design to the Loongson-1B, but without the alarm feature.
>
> To Keguang:
> Would you have time to test the driver on a Loongson-1?
>
> Thanks.
> Binbin
>
> Binbin Zhou (2):
>   dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
>   rtc: loongson: Add Loongson-2K0300 support
>
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 13 ++++
>  drivers/rtc/rtc-loongson.c                    | 65 +++++++++++++------
>  2 files changed, 57 insertions(+), 21 deletions(-)
>
>
> base-commit: 16bd954c93360145bc77cc601e350913fc28182d
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang

