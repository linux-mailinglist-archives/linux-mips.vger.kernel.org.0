Return-Path: <linux-mips+bounces-11192-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9EB51329
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 11:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECEFA162B81
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8970259CBC;
	Wed, 10 Sep 2025 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="henoxB3G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFD257459
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497810; cv=none; b=bmVULJkbP1lW/BXtlW3f1o4dNwrAQ4jczoxtqERCkufkBijcAUGvbrXsc4ckrLhGi4RWrZ5Bvd29NCff34pc79+vAFotz68+xa3IfCLqpaHKSLKLOxWZ655qMFXUwF4Pg9Pksff3jwSSmPxxzp9l5JAUGCzrsDvZdRWnMQExirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497810; c=relaxed/simple;
	bh=Arofhyx1TEu7R6Dw3jah6c4cRa9rC5Al23ys0fj9/3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AD2s1F0g3Fgt/GYiX6WbRTyl4O1vLQtilgOHtAkzvQ1fZhSIvDL1G69gyxvuO38dYlcL7D66jhQjNm+lOHSC3Z+dNP+fwlwEyAK5w4FQrxy8+qk8in6O6wahJhMUvkCRoF8GA+lFvvsEBk+xiR0D94p0vBgxO7zGEic/wdOTDYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=henoxB3G; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso7781916e87.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497807; x=1758102607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=henoxB3G6xCTEb3bnN5y7upQTW/vvD4X/ipuVoNirEXLEzKj/lMG166PAcXDBNz0Aw
         xhB3Le5v95e/i68gHLcbty8Ciz3bQYhreEBegvv4Vc988Jeq3cjVcEK5T0A2cn3I5VWF
         XL9CKYmsDCoEHTaOUBpd4TupYuOQuIMtuISJGh5GYcyLlHzh00y4HbqHoZJ0rg2htdFy
         GTDIMvDlmCXFaglOcvJNlg/YjbwVQCu2VzKoTuchbhTCrK94YS2ujWqf2rSEwZowwjRN
         wKw8NudFnzH1AnKxSQLGo9LNl5fqm4q/BEMqMPq86wBe39iB+m6jtypBh/r6ppN2Usu4
         jNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497807; x=1758102607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=amzy1mb0P/GiodZPfEWb/JNfpi9D+8jJQ7CY7rzeaZbJ+7zXqE6U3rAsyAs5wAtlNX
         D/86j5w19fsz79WLV88g2Yo8BibP5e5/a/fPhEzoBDbygKCNbIkite1lJIPYVNnd3RmW
         EvXqNeeDTSynHfoB4rFcoj7htPOaCumGWwXOVoqnIQ7On/cXwk+O/TA88VnAAXz3TPm2
         yg2841ZFa8xo8lQVQwdzc+q9FsuLI9TrKho8aqJR4dDsw8hlY2XVqmH0d1DFeXL5AbE3
         VabpqabuBE9b0X44FWR9uE3ZTyGf2aVH5/1Ehf2jtIv8HR9vTx9wRswht3qENhYkZYdQ
         /dtg==
X-Forwarded-Encrypted: i=1; AJvYcCXDUIXu6+x9LmaSOGm5cuG9xpGeIkSSsQjDjmM5Qy0Pyv49isonDgVYJr9BVXpNHjtLNGFUphMGzRwN@vger.kernel.org
X-Gm-Message-State: AOJu0YzA98sznRQs13svPnyu4OSNoRuIQz8uSp5VxLbQOl7bVznq5V3A
	xVjFNvSs98FTK66W1EMi7X4zAgjldMzqetBYOGy2oV8fCi0TQybyz89F/I8gOALD9eTvKuP8Nnc
	+43M/ovRXlmaIrR3KrPtAEZ7sbqpVeJr60U2iPMlZgQ==
X-Gm-Gg: ASbGncuJbWpvh4Jx7hHB3nKTGe209zB4GRmmu59OCJg0OvvAlZN9Ea9CD149bqAPT0E
	aE9gmw7cjRX/jnT/jeVFaNq/a0c/UTaKPmL2g+w26AUYhkdKlrDkkMaTYbWmJuqc7XUV8licAr2
	dm2z2TgTNxGxJymcPA02GH6z2NL0ieMAgQa2/+t2yH1g3pOy8t6c+sbjE6T/kRCQnzDc8+gIUfi
	mgfbLs=
X-Google-Smtp-Source: AGHT+IGq2x91wz7j8DANH/yJwpeO4d/hIy0ABq1WES66C1SeY2aK74/VWAJ5lsiz89NvTXBUTDFt595MC0reZwFBRxA=
X-Received: by 2002:a2e:a009:0:20b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-33b536f14b1mr41029971fa.31.1757497807337; Wed, 10 Sep 2025
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <aMDYdp3H-yOHU1Pm@casper.infradead.org>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:49:55 +0200
X-Gm-Features: Ac12FXxu2Penmvb-ANhZIzZlxEacPcTMGZ42OzvKFfqr5PHU2ajbCjOLxBc-XSU
Message-ID: <CACRpkdZZZNV5BdNhyXEK__=EJLjDtAEsc2Kv4Tv53+=Mv-8R=w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Matthew Wilcox <willy@infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:46=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:

> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.

I sent an RFC patch so we can see what Russell has to say about this,
it is currently only enabled by default on the VT8500 machine.

Yours,
Linus Walleij

