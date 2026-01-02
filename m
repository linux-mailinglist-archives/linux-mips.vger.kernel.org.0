Return-Path: <linux-mips+bounces-12716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E1CEF639
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 22:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B25CB301357D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 21:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B710C26FA77;
	Fri,  2 Jan 2026 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8sbqvwe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FAB25A2DE
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391076; cv=none; b=b6eNFjH5hBLRD748kZILKBMMapOFTOzMhpP4LpCZkzAbD0S++q0BU8BtGQcMvmzehKXsqTBudOQ/MK/pZB7f70W4whNZnv+zxIG/txhQoy7C+CMdNbHBRDHpobGipNg0IQqzliyJ4a/TWCDVdEQXCKdJMACVsU2o1bRkZtEHrOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391076; c=relaxed/simple;
	bh=fTs6oGgbwPQlKyYfk29PS4txtHAFR2mw78lr28VH2FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMcrpHj7lpI5jygvmeY5/+pQQaK1/B/hZDcyICJu7upkUKLQbIubMM5Su+Z5rWNuWhCFbdoJgYkzCkjML4y89UIPIiSNoMbusIJV0ULKe4UZaGEMSGHtkwyPYuy2RIZXX2Ku8zAjWzCOfNFU/LiO4PcrQjzZqL3YCyO0bKI5M+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8sbqvwe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A20C16AAE
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 21:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767391076;
	bh=fTs6oGgbwPQlKyYfk29PS4txtHAFR2mw78lr28VH2FI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t8sbqvwepuOROzW0vidBuOJL+fU1E5vAZxW8DnB7gIOQnWkIv0SlypFBTYM4SO+/D
	 eP9hOTFX2tty3e3rXcN/LvXmzhlNXmwJcS+3r36YIz0mv6s6lCqkZbn2TG988ocsBd
	 PEY/Ya185+Xusa8hjxkRkzwMy8milwl3cs/QJY9r5Rh7nJJasiy/+K9TRfER9JT/TF
	 /162CKIGLuDTwXTI1MoqqyyO4l/+rtvytt732mn/Jjz5WIGu7juXFzQ5Z6KaCmtydx
	 +t/ARZl86hb9fc2XH3LTeWyQd+WYmxmiILFOBvnap/ijVoz/WIMM22bqtfzUcnOkPW
	 qKV/s5BecpDpA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fb5764382so94464317b3.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 13:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrmCbikjvPwtM7LZ5++OsLObZSVrJUcKzt5/iJk+J7prEoZWuWC6utsIOeSbZ/EsnEv3oTwlmDAv1P@vger.kernel.org
X-Gm-Message-State: AOJu0YzLH5mydOyEyMd4gMnN5xVdpLRO4SIWxQCn/x5hwsADHOTX+mnh
	TOhvhEaSTfkwmebWWQpTVqEkhE7YPkImO/CAwJvVQC9wetwCRnhhRtVfrDhyTTO39KPnGi2LJj2
	lkpVeSfJviyHgEVNkzJ7XJxzyLCG2ZWU=
X-Google-Smtp-Source: AGHT+IFvit43PZt9CuDzKVz8Z4nOImtIM3mmQbkBxLTqEsYzLUfYqHgxNY5RM/1/uMvN5EeCL22OJeziENQQsOw38sI=
X-Received: by 2002:a05:690c:6012:b0:78c:6854:2771 with SMTP id
 00721157ae682-78fb40291d2mr364053437b3.36.1767391075577; Fri, 02 Jan 2026
 13:57:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com> <20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Jan 2026 22:57:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
X-Gm-Features: AQt7F2pVCJ5RIFpGUV8kYR4yF4m1vRENrYeYecI6n6ttv8lwmY7u2GpoB-2JCic
Message-ID: <CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benoit,

thanks for your patch!

On Tue, Dec 23, 2025 at 11:02=E2=80=AFAM Beno=C3=AEt Monin <benoit.monin@bo=
otlin.com> wrote:

>  static const struct of_device_id eq5p_match_table[] =3D {
>         { .compatible =3D "mobileye,eyeq5-olb", .data =3D &eq5p_eyeq5_dat=
a },
> +       { .compatible =3D "mobileye,eyeq6lplus-olb", .data =3D &eq5p_eyeq=
6lplus_data },

Which patch can I find this new binding in? Or is it already upstream?

Yours,
Linus Walleij

