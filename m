Return-Path: <linux-mips+bounces-9497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFFAE79EF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 10:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2669B1BC460D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 08:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2060620E007;
	Wed, 25 Jun 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX3kUr1S"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1396020DD47;
	Wed, 25 Jun 2025 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839731; cv=none; b=gS+wvpE3hgKGa4J3JAJH5thIPFZm3K+X6Ed2FL47IFY7K7iMl/3T6at5gbhYoMMBV0pfBNn6JzwSmx2eNvYWpkHC5WY6m7sAUP1uJk7gQ0/986Z7RGK8KJbOIgkk3g/gjgE+JUvBvdzDhTXfPyBOZuB/qVIDznFIeSYcDLNqiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839731; c=relaxed/simple;
	bh=S7AHqLNc8OgX9lul+SJps+d2sDQP6HUIEKI5t1uOxj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSj68cBSozqSz4Uke2f2rKgQapfWEVjdXURD3dB9c+7yQ47DzZGzCdvia6okpK9QjWlr0vCLt7xSE65ZZPUkhicQx+5E05z+l+6q5WKPIcxZWCnJxmrS+zcPH+p9Z8BfyQXrCf3d+m9tnFZbMCSXx4EqODtDzBL6M15ml527XpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jX3kUr1S; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6780452a12.0;
        Wed, 25 Jun 2025 01:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750839728; x=1751444528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RMaykCUkU+YKFSp1u9A4eBWNtqTWAYcXznsQEej4Xs=;
        b=jX3kUr1SWI7UXdFcb9Ss9wmTHh9XOue0zG6uSZXtcSp6814Ig4j+444TYdf5Z8ectx
         lsvKZAts8WLYUlB8k5B0iS6VSJ5OixhBolLOj74Cp886CV4I33f2g8Gz3ybAHfombu6m
         TOGnFXSy93tu25UDtyo88K/0c6yQrYqkD0kGPVa5X6WViV0bc9EMbbKAtQ5guMAQzQt4
         HMa7OO9EUw8IUShpIOmO/V7Wwjq+Vjde+dwC1UVRE/dDVlYHo3CWpSaJA1dZOER6jIWg
         ccQXQh3o5BklWluWYZlCTih54CuqebyBrvf831PdRbZhemWqo73a86gXillG/cCDrR8R
         6GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839728; x=1751444528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RMaykCUkU+YKFSp1u9A4eBWNtqTWAYcXznsQEej4Xs=;
        b=JGcF+3XSStt5755nAYyOOK3Q5dMpBVpFjW7N6gXAt6t+fLs2ZZ3F1Ah31CrsW8jnJu
         sngYZt4k7lZbp+MUBs9HK5f73VHVtKFMWQxK+jRhbWAFVROpVsmB4UmwD9hnjx4NHhki
         I1m3Ouj2kR/XJpcIRAe4ESGYY3NRb+U7ybtjV+G1yC794GtgJN8sI+Zux8QrdabsA1z3
         6pYdI9YDDuZyRYaP0++VRDFeqQvwMVcRwXeQoqmpcQz42darteksm5IErga8MATuDV9X
         S7boe+e5sBynlGJ2D04BoXioPt82T8KuqGuuH7c2aATjbgwwJ1pm4sziB5LxpXavC+Dc
         DvAA==
X-Forwarded-Encrypted: i=1; AJvYcCX2lpBVnVDOMYKmC+gxrgXOvHgE92uSvYEnpLaFtQnIaKNSRoquV8mTQgYagK2HRiGvriCAmt5FJkVh@vger.kernel.org
X-Gm-Message-State: AOJu0YxorIYsTLuVVAzADfqnTK6cFgMsOoRho1vke8Vfwv5UISph6Hit
	PiyDPTDVKGJTIyC9tH/NJ0qbweAee4SridL1bP3usCfECx22s3gAcoq5MJJDFh9U7yYhmhekGkQ
	qi+sTLF7Kiqw7aP2XXihXF4Knry4iiVM=
X-Gm-Gg: ASbGnctA5j2Hmn19y7xDgukL8FXfi641irNQmGnHMaGsk+8akiEZCKcWsbUdjhWfzMV
	cfwKLkPMcCz4qSJv9Ooy8mNCCH70qR8PkyQLSc9PfFhtRY+dYoiiIRxG+WjhRyh8Yck2VxfPgtI
	znpB5kJofSuysAyR4IVAJ3JV2Ay7w4cgh2Zfgc6VKi
X-Google-Smtp-Source: AGHT+IHQFm4NrTpZCUx4RWJCKJ/gYyju/8hko/dEf/0F7yTJOdkN9WPhYZ1lNRzAAK+Gl4+GQ5cuyrmzI3aZI0mB+N8=
X-Received: by 2002:a17:90b:2e87:b0:314:7e4a:db08 with SMTP id
 98e67ed59e1d1-315f2675fc7mr3886284a91.18.1750839728247; Wed, 25 Jun 2025
 01:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624115810.37851-1-ezra@easyb.ch> <20250624115810.37851-3-ezra@easyb.ch>
In-Reply-To: <20250624115810.37851-3-ezra@easyb.ch>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 25 Jun 2025 10:21:57 +0200
X-Gm-Features: AX0GCFsx9Ssa1GY2joTF4Lsttcx1aR58OG5n4g9zDCJuQYjdg9a39Xmmlu9Gd8w
Message-ID: <CAMhs-H_QeMy316h67YHnN01ba-ydCf6KwyAdqMPrcceLu0C=hA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] MIPS: dts: ralink: mt7628a: Fix sysc's compatible
 property for MT7688
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
> Otherwise, the MT7688-based GARDENA smart Gateway will fail to boot
> printing "Kernel panic - not syncing: unable to get CPU clock, err=3D-2".
>
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> Reviewed-by: Stefan Roese <sr@denx.de>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

