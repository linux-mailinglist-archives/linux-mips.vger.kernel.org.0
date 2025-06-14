Return-Path: <linux-mips+bounces-9304-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B5AD9A15
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 06:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA037A71B2
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 04:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952EE33062;
	Sat, 14 Jun 2025 04:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBx/2jE3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295802E11B4;
	Sat, 14 Jun 2025 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749876472; cv=none; b=U7La/Xjtpr25jNV/1S0G3Aw0v/6zZoKLdxq9JYqRIxB0lu4hublalpU+okhUvSvgs3MQ6Ktyw0hblwPPu/ahVx2oFyqkD26G91XNMhf7a/VMh9VBOH1Eglt/6vJhIKvj0GpvjPFp+iIFuOsMIB/+HQ20VO4gaJHAjw1d9bYDE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749876472; c=relaxed/simple;
	bh=N9c5DDgh+uPzpV1Ib3ea6zYaFkvWFcrjOKJ6OZEg9ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OioxyZfplFXJ5yalQvq/LtfaoPOuAxgyIROJdkdtTwTewmsUu/7WFXMfVLqcbB1U2MU+Rdf52dx6CQ2McuFmjrTE5TRiBCmsSNzSeJu2mw6blaxSUa4m8V5tHYNO1Lv9nNNp8h9uokiSeGPAEeitsD0cxtpecA/vqvGy/COwAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBx/2jE3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2280941a12.3;
        Fri, 13 Jun 2025 21:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749876470; x=1750481270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoaakO6YOSR0ROA5btGta1AFobSn2X4lCaT68szSFe0=;
        b=jBx/2jE3K3XAxBlHnlWmChciWPTokdLpni5m1+tbDzURiNqLUHctUVoTzqqiYYftgm
         vohO2mnJEmtNGm+hFeg8GHbuw3MqU5DzoAzjGA22NmLiYVaNGh+J9D/+ECYlsCr8cPbU
         gyjhGbaIexdT7L9svIsmwjVB9PJs4FkLzeTAD2z1RXkRyDNEldeMMzXMg9S08RCwCXyS
         vB1tV4TLiv3kRSkmlRzum7kERgoPz79BH7Zvou+5YiL+EWeYjMYcLQGdTig2A7UdE5hP
         j4fIsEo5fkW0C7GYxbJj/0vfb2wNVLlnmPIp2yHBXe/MttLMgzDKQZ2KZFw4WLOzU1Hn
         /wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749876470; x=1750481270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoaakO6YOSR0ROA5btGta1AFobSn2X4lCaT68szSFe0=;
        b=V39yWP6JM7vNAGGAXoKYcEO/+emrh908+LPnj6LUUlS04jYQk8BW0A6aTzsi9NP9/0
         /FSjsU8hagATHWfc7kFMkwwr6U+nzDS0cGSQFwu3/ujjJ+Lp2rN7FQ345GMTVvyX8XPm
         Ne41djyaddym7UB9OBK5RiWSkNVN+dZjkhp4QE8PmXvPxkbvZPH4hms53xIGNq8WOFW0
         IcIEeO3du8flaz2qOFvlaZit0Xn9x0NRqRa1zxZCiE6vmjA/xDq9jAV4GRTIHDAN3PeD
         EApAwoT7+KkXb2OYiLuJRkz/F5HOsptl1hZtB7Hayn682jhwB9aBYV2OH8KWLF860P4Y
         Ojiw==
X-Forwarded-Encrypted: i=1; AJvYcCUuZl8Mo7PkIjGAGBQvV+a62dFud3v4sXV/pQp5O0XEF4OmQ+Eo+qR6TonOg1iG2ngN8KgtGz9A+XwK@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKV/J5/nnaq40XJGVg5Pk4DhzqBv89GJYEK1p/YF+IhlAnUsK
	4ir9vhx0x0hLHmE/qX6jnsIfF392OgCiXEcd9CvKi9F32g2H7CYEy3BjOpQEVcxNWzvtLXSwwuo
	nuNViJhhVzwZUoSOjPphsvjulanrVt73/u7+v
X-Gm-Gg: ASbGncuVMne+d9twpbGiMVHFjP/tET5rbXXOW9mj3OiMWSXvM8NracYeXVNYIyDWqYK
	ZjQjEeSOJJ3Vnh1M3sokQhJydJ3pmOrrKHJJx9QwnUT0A8g5OJULFrTXd0XF2DGSwJfR+DMe9Hc
	5n5ankczOkRpEu/+YZ5jcoTjnxL7T2e0fvEn8vE0IF
X-Google-Smtp-Source: AGHT+IGFhcOKzmKkTxffA09BQ8bK+1tel+LtWrgytP2AFGLN3+qQnLI9CsKMabbuSQDRyxqkfYQKf6BbWt9VkpNqyOc=
X-Received: by 2002:a17:90b:274d:b0:311:c939:c848 with SMTP id
 98e67ed59e1d1-313f19d0359mr3732545a91.0.1749876470305; Fri, 13 Jun 2025
 21:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-4-ezra@easyb.ch>
In-Reply-To: <20250611194716.302126-4-ezra@easyb.ch>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 14 Jun 2025 06:47:41 +0200
X-Gm-Features: AX0GCFuJFmxQvHNTqxHocsFwLW_L8nax6kfaHx1sKfnTnn5JTtBOc2nSJArDokY
Message-ID: <CAMhs-H9B3G2fErZ_DaDzyW8MDJACmsWnhDC2ojVxaM8tRmo8TA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688:
 Fix power LED
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
> When starting up, the GARDENA smart Gateway's power LED should be
> flashing green. It is unclear why it was initially set to "off".
>
> The LED frequency cannot be configured in the devicetree. Luckily, the
> default is 1 Hz, which is what we want.
>
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> ---
>  arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

