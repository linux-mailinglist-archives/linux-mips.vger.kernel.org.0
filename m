Return-Path: <linux-mips+bounces-4920-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1C9551C6
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 22:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED02DB22258
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 20:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E348B1C379B;
	Fri, 16 Aug 2024 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dwuw5OBs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC379137747;
	Fri, 16 Aug 2024 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723839536; cv=none; b=iCQYE0tcs2RmEKwGRRyDirogcIB7uCf1gVmPui6yj5rjj+DGh9jgSySm8mricywZdQHJDkWq4EsfX12VsOBFlDZ25DKyKndxyy41FGzxm9rl1KXfk5N2h17xWx4Q8g/r3cPpZmzIhlRDDB8a9Vr4H2tU2+TTxBapMBA1DdK7Cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723839536; c=relaxed/simple;
	bh=7o0QpYyR6WCcVBZa39lqMIGPmqBnk3rj+kLrqFXcxDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfMjB9pcAUcLowcajGILIo84OE/5yQ/K3k1Tz8/G2/me75Epha09V4DBTYjXxNayMzyHB8fgPGJU2jLGhiqD/2wHutD/BVP9qpr1laxAi3mxwEUNnCFQYUBmxyDYUKUcudsLbKGm53UlQDz5F4JkcLP5W2RkZIOztgRaDrOz0Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dwuw5OBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE64C4AF0C;
	Fri, 16 Aug 2024 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723839536;
	bh=7o0QpYyR6WCcVBZa39lqMIGPmqBnk3rj+kLrqFXcxDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dwuw5OBsYcOdZ9QcwFSqqa+YtaFEFhDaO0x/1ylQQW2LTkbjDIewJL30bMsE4f//m
	 18CK/N6+TzmzxH4XsRPBltfWntUIDfGFEdOkJrEd+NFufIBSOFcQmzUrBjckxwyW87
	 +p0TBonGxOFzu/sR9DZVuxdusdnQrF1FU47t4WTuzgo1hirNWUkdKv0GlyRDy6RpoG
	 3pA4ZXM+xePE9uqgIUzv0mkJjXig9wlJAlakUitmXMUvx1+4t81cp6kRQmyUhzOs1z
	 HBqXNJdo3+/DUXhfO4siuuzHkOi7bA//PPRWqdblEa9lodp+TY/lhzZ1QzhEk9MMSz
	 pzOD4llJSpkKg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so3185862e87.2;
        Fri, 16 Aug 2024 13:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEpiS4pQIbjOg3sBQhqb03eEkVVvhsiPtuEdY4c3Ff9C4+QhGSljfVKXC5wQeYk6kmxGc1WgdchzpYXFXfKEh3YrCkSNYB8TMDlqtZoTCau7vm9jSt8SA/A+PinQdXqIMZRc9vGVRXKQ==
X-Gm-Message-State: AOJu0Yzy4nWi6+/5daSZtCc68kpfBOeXZsWpq5Z1TcuZ9rJM8YFjbCCQ
	sQN8bVQMcM4fq5PSrJmY2Wmvuomk5oGiG3it5wGPVZtTDCLPDJxLPx1OT6IoHUoh/a4TcbPEOac
	esZVaQ1T/9s+pZ6JxbBa+bsk6nQ==
X-Google-Smtp-Source: AGHT+IHmyRZ4clxGPJquhu23wu/3UXIx0sRx/uOqLud9h9oe+/y36kFFb69u57DKWH7vH6u9ARgZ9iqQUCozE+a2iDo=
X-Received: by 2002:a05:6512:3b95:b0:52e:7444:162e with SMTP id
 2adb3069b0e04-5332e07fb8dmr303150e87.55.1723839534429; Fri, 16 Aug 2024
 13:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816124957.130017-2-ajones@ventanamicro.com>
In-Reply-To: <20240816124957.130017-2-ajones@ventanamicro.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Aug 2024 14:18:41 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0fXJarCjLA1ZYOiHbM_qn3dtG00Xz+Z8qGCg8Wu=dgA@mail.gmail.com>
Message-ID: <CAL_Jsq+0fXJarCjLA1ZYOiHbM_qn3dtG00Xz+Z8qGCg8Wu=dgA@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Support #msi-cells=<0> in of_msi_get_domain
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, saravanak@google.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 6:50=E2=80=AFAM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
>
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
>
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. The code removal also requires changing
> to of_parse_phandle_with_optional_args() in order to ensure the
> legacy (but compatible) use of 'msi-parent' remains supported. This
> not only simplifies the code but also resolves an issue with PCI
> devices finding their MSI controllers on riscv, as the riscv,imsics
> binding requires '#msi-cells=3D<0>'.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v2:
>  - switch to of_parse_phandle_with_optional_args() to ensure the
>    absence of #msi-cells means count=3D0
>
>  drivers/of/irq.c | 37 +++++++++++--------------------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index c94203ce65bb..690df4b71ab9 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struc=
t device *dev, u32 id,
>   * @np: device node for @dev
>   * @token: bus type for this domain
>   *
> - * Parse the msi-parent property (both the simple and the complex
> - * versions), and returns the corresponding MSI domain.
> + * Parse the msi-parent property and returns the corresponding MSI domai=
n.
>   *
>   * Returns: the MSI domain for this device (or NULL on failure).
>   */
> @@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device =
*dev,
>                                      struct device_node *np,
>                                      enum irq_domain_bus_token token)
>  {
> -       struct device_node *msi_np;
> +       struct of_phandle_args args;
>         struct irq_domain *d;
> +       int index =3D 0;
>
> -       /* Check for a single msi-parent property */
> -       msi_np =3D of_parse_phandle(np, "msi-parent", 0);
> -       if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
> -               d =3D irq_find_matching_host(msi_np, token);
> -               if (!d)
> -                       of_node_put(msi_np);
> -               return d;
> -       }
> -
> -       if (token =3D=3D DOMAIN_BUS_PLATFORM_MSI) {
> -               /* Check for the complex msi-parent version */
> -               struct of_phandle_args args;
> -               int index =3D 0;
> +       while (!of_parse_phandle_with_optional_args(np, "msi-parent",
> +                                                   "#msi-cells",
> +                                                   index, &args)) {

I guess you just maintained essentially what was here, but
of_for_each_phandle() should work here. It's a bit more efficient too
because of_parse_phandle_with_optional_args() is implemented using
of_for_each_phandle().

Rob

