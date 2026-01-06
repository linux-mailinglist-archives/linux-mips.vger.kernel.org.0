Return-Path: <linux-mips+bounces-12762-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75CCF6815
	for <lists+linux-mips@lfdr.de>; Tue, 06 Jan 2026 03:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEB1F300B003
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jan 2026 02:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4B01A256E;
	Tue,  6 Jan 2026 02:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiHP6l4e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981072A1B2
	for <linux-mips@vger.kernel.org>; Tue,  6 Jan 2026 02:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667667; cv=none; b=eLIovXsKEGqgOaff094VihNX9khVEMWvk3b93Bh6vW4IOovx7xF9nBYrzQ/iLA34JYFE1MBpWGSulWh1lrvIm9t8TsaH+e6E0s+7RYd5ONMi7gPrdZSXfTjiyOW/6oJcIydjxxtBrWcol68pLwUTuo9hqSyNyPdRmKt0cO0dgvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667667; c=relaxed/simple;
	bh=N3aSnhZIgjiwekPzi2HI+ImFiVFHEb+AclWtiAFQQJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9gC3dqE/Ff81Z3DuMuFyPo+GvWa9bv4GOF4ep0weFj9gyTfyRsHfLf442tPV3jMEYIsPP2GO0qqcYodQ39khzm+yL4yuco3cZlc9/H3jas49hn1WNOvg4YOTmUhd0ZxblPh1sUC2E38u8mlOk/NxKlntlnV0N2mAtV+ll+bnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiHP6l4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEADC4AF0B
	for <linux-mips@vger.kernel.org>; Tue,  6 Jan 2026 02:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767667667;
	bh=N3aSnhZIgjiwekPzi2HI+ImFiVFHEb+AclWtiAFQQJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XiHP6l4eNr8EakEPdxMOMOm0qM3rlB/y6dzTJeL9AAqzyAHf9Eac/4XyN5M7MJZrB
	 GTKvex1BzYGw8vOs33hEquPGOYp5SN4VnMgLsfobeZ6CL1/gw0nl7OvECHjbKOAQOz
	 DrrbMQgUVQj8h4EbV3yOUMtJf62RqbVzqUnbxN02sAN57FmwChlZxz+CFkCkRgE7PR
	 NbIoX0lH3yPjOlqMFicbzUeh4Z1aqG0avxQ0N0bVU6mXYFN4N7if6UIIR5M6O9vy3D
	 h/FTCPwV9ZpdvyfrwVLGJVzSP9ssUbDv5tsHjpwvHOjZIWjD3AgDvIG+fPcPZCRQg2
	 tZStSSo28Hn7g==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8010b8f078so97642566b.0
        for <linux-mips@vger.kernel.org>; Mon, 05 Jan 2026 18:47:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4HvcjsqK/UCSLze+wQtI+D6wBL/2srDeJQqWe+2Zu6ABIylF9mlEROnE/K58rxe6LqaQ4Tie45+Nx@vger.kernel.org
X-Gm-Message-State: AOJu0YySJidfRPRLN8gMTs3lGmzjDYyhZvIjlp0zLY+eqfOhjulKCV1/
	UW8YuoJevuuw9C6VG9VFketjxylAOfLEkJB/D3UPt73YcTdjxut7jIvlHWlrvH/lefjWq6g18rT
	+8LpvBIcwqXzNaT2lOtrM8vEigt4JPUw=
X-Google-Smtp-Source: AGHT+IHqdKo1Iny0QTdme3kQccTlNjL7LjWMUrRkgByHYmfB1rjzEjWuE+xTBKMrNQYZYm6jKxS5PQrZFuIyBjA+4mQ=
X-Received: by 2002:a17:907:6d23:b0:b83:1326:62e6 with SMTP id
 a640c23a62f3a-b8426bb91c1mr175679766b.35.1767667665746; Mon, 05 Jan 2026
 18:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1767663073.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Jan 2026 10:48:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7fCPeejwj8_kV8HoTJ1_M70_seLg7qrHyGJQ-k-wyjdw@mail.gmail.com>
X-Gm-Features: AQt7F2oFjvS3yqM1tFA_zknCFILmdEELXeONOPKPgMaTak3RarAGIOqQXnvgt3Q
Message-ID: <CAAhV-H7fCPeejwj8_kV8HoTJ1_M70_seLg7qrHyGJQ-k-wyjdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] RTC: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, Jan 6, 2026 at 9:34=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patch set introduces the Loongson-2K0300 RTC, which has a similar
> hardware design to the Loongson-1B, but without the alarm feature.
>
> Thanks.
> Binbin
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> V2:
> Patch (1/3):
>  - New patch, correct Loongson-1C `interrupts` property;
>
> Patch (2/3):
>  - Drop Loongson-1C changes;
>
> Patch (3/3):
>  - Rename LS1C_RTC_CTRL_WORKAROUND to LOONGSON_RTC_CTRL_WORKAROUND for
>    consistency.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1766471839.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (3):
>   dt-binding: rtc: loongson: Correct Loongson-1C interrupts property
>   dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
>   rtc: loongson: Add Loongson-2K0300 support
>
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 14 ++++
>  drivers/rtc/rtc-loongson.c                    | 71 ++++++++++++-------
>  2 files changed, 61 insertions(+), 24 deletions(-)
>
>
> base-commit: 16bd954c93360145bc77cc601e350913fc28182d
> --
> 2.47.3
>

