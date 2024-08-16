Return-Path: <linux-mips+bounces-4913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF379546E2
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 12:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A1A1C229FC
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 10:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2D6194C73;
	Fri, 16 Aug 2024 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="sFzt+JB5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AD198838
	for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805107; cv=none; b=VN2m47lBV1rdf5wJNOrhnwSWeHXPEVtutiEJMC/siet5ijNRsS/Fhxph1S7rB3Jr4WKSJJUPVmOLbz9n+bV3faJ4J+HxjMJIN7+RrbcYL2O3pssYDwanD2LWUguqYuPZs2JeO5XTraIgkeE1uCdfZb8A4buSwymXAmlPOq9QEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805107; c=relaxed/simple;
	bh=TuI+3JNN/KVJjGPeIeWqNHx4YCm3oM0eyYi9XN8BW70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfiyCqs1ZX3G7KDyYLroQBfWARtDU8i6+iRdWU4C//auX8rltCqOdM7ekwKcMTUuLKPLOxr5/hNUBAS4hKYajko/nFlrsIEKiJntak1VhgEi+cFk/qGHF5Vws+u+kAmiGGGsZowOF8Mj3TqQ8DdJj4KvHwxqqmalPFmmKJ8MDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=sFzt+JB5; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39834949e42so6967825ab.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723805105; x=1724409905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=sFzt+JB5dOy/z6wotrdK40bk0nTjIwec9kRqhIvAHWT8YL4YOxHYx+VXuEuUYy6Pyj
         4wbrkngvQLViFABtEa2FaBEci0eYQka/jTrAlLdy09l13bifEmIMSCZDopW5Ns0+Sj1k
         PDO2nEQ34iQ8/bPpN3kvf7GyEnC8ucRPodtyZb+EFMZnNgCStMGZvqm+spcfIYAZmnIj
         SpYX+SSkS6AaeooJAbc6BTME7y25/8CowLwEIT/Mt2qW6cf0vJR880KuBlEmpaAqWyUv
         LggzE49BQtlmeJ/c6Zy2sbvhhncHUde2Zd13LU8CLI0egWbFJEzL6k5Mu+IbjGL87sPv
         Gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805105; x=1724409905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=AAXZi8SNcJcyUYoxhiUCv0apoI2iiKFr46Zf6KiTZiAtaDxQ5hiZOPGFzuSku/Ii42
         Gb2OChLIq/RrYy0c8MNbglP3pg91JMuB4blwPToS8EKlEORZhj4bvMXQRuvUYbPF9hWc
         RezOW0uRlYHgemqEvoc0CAnH1shBHsei+dtivPIac1kjw4h3Oq4sL/LCrUIIcvwDs+ve
         DfgqGNTQ9OyFeZnAhBQl+HFlivG0MU6Q8o7aotE1JeIq6HJHFV87DDVW8jcy4CtvKXHQ
         th2J1PILgHMWB+RTaOa+iqyAj3yETuLljOpkwKwxRAlC7NFcJoCVLJ1R2KU3+94kOnTC
         FVkA==
X-Forwarded-Encrypted: i=1; AJvYcCUxb/FhIbBwYGyhaQfrShSNNWldkeavkVJMtCcbtuTbxj2I2/neJKxU0Lpd65Wsyz2IQIu8dMbKQXuXu1VK7vH8iWt3ETENfpcHkA==
X-Gm-Message-State: AOJu0YxbEbIudV9PTH9VWuKIEcMB58Qp5mGHCfQwlBIDivFJnFTg/Bur
	vw1uG0+mc/uCYbbyM8bVLuGa7ihrK+7IAWLSBcVPefN7RD9/ISBmlFV5LnyRi0oJ2pAJrKWG/LU
	xAzcKWB0oOG68Pw49PiVLkxMwTJPjvpXgV1H9jw==
X-Google-Smtp-Source: AGHT+IGOY2wZxg3oQyKstZDxzeAo3jAK3M41BK/FipMiQ0FhdiHyS6sxut/JjEf5JetJ4eJZeTSIb18KGPl1+eyfyBU=
X-Received: by 2002:a05:6e02:13a6:b0:39a:ea20:bf7f with SMTP id
 e9e14a558f8ab-39d26d791ccmr34640735ab.25.1723805104686; Fri, 16 Aug 2024
 03:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816095520.96348-2-ajones@ventanamicro.com>
In-Reply-To: <20240816095520.96348-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Aug 2024 16:14:52 +0530
Message-ID: <CAAhSdy0wxpDXoUmGyuQOeMfNCubdp9_iYdBOSN=EcweG1nkwwg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, robh@kernel.org, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 3:25=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
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
> casing and the restriction. This not only simplifies the code but
> also resolves an issue with PCI devices finding their MSI controllers
> on riscv, as the riscv,imsics binding requires '#msi-cells=3D<0>'.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/of/irq.c | 37 +++++++++++--------------------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index c94203ce65bb..026b52c8ee63 100644
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

Dropping this special case of single msi-parent property breaks
RISC-V KVM guest created using KVMTOOl with AIA available
on the host.

Let's not drop this special case.

> -
> -       if (token =3D=3D DOMAIN_BUS_PLATFORM_MSI) {
> -               /* Check for the complex msi-parent version */
> -               struct of_phandle_args args;
> -               int index =3D 0;
> +       while (!of_parse_phandle_with_args(np, "msi-parent",
> +                                          "#msi-cells",
> +                                          index, &args)) {
> +               d =3D irq_find_matching_host(args.np, token);
> +               if (d)
> +                       return d;
>
> -               while (!of_parse_phandle_with_args(np, "msi-parent",
> -                                                  "#msi-cells",
> -                                                  index, &args)) {
> -                       d =3D irq_find_matching_host(args.np, token);
> -                       if (d)
> -                               return d;
> -
> -                       of_node_put(args.np);
> -                       index++;
> -               }
> +               of_node_put(args.np);
> +               index++;
>         }
>
>         return NULL;
> --
> 2.45.2
>
>

Regards,
Anup

