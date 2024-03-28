Return-Path: <linux-mips+bounces-2347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D4880AE2
	for <lists+linux-mips@lfdr.de>; Wed, 20 Mar 2024 07:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972DD1C20B54
	for <lists+linux-mips@lfdr.de>; Wed, 20 Mar 2024 06:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9146217577;
	Wed, 20 Mar 2024 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="38JYpUkT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00601755C
	for <linux-mips@vger.kernel.org>; Wed, 20 Mar 2024 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710914408; cv=none; b=fLZT19/JSgsDQqJ6yvbRsCH0o9FXXIR4U5hVetposRhSBiOe+qxifwneF9EDz4NFm9ih5O9h3+h9bbTLMlY3dB6zWkCRnVpE3Y63tyTGbfl4dDgBEQnmLdHy5x4ylIwDFFlkOEOQ37s/wUIJnT+czzFi+9NR3pjaBsqnlOgWReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710914408; c=relaxed/simple;
	bh=6FBlmkovYz3g0MfGGxRWQ6YmePlnSlZJ4o3EpgtSrEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F8TAJDToF950RpfmWTtikz/ZNlkEdiyU0TKM+fgjUy5WGXmrKZUSk7NS2yy4H+Wz5y6X9/DrSUHek0oTAXglAZ+ue7/7gTiG2BwLj6J2MoBFC//JTqxOC3j+VV4rjMdZ8r6zxK3hydtw0UBdj4pJJ2BnkPagcM8Jk5lOJSicKfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=38JYpUkT; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60a55cd262aso112243057b3.2
        for <linux-mips@vger.kernel.org>; Tue, 19 Mar 2024 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710914406; x=1711519206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZTYFP7cQrHabDLXpeeWZ0a2uWz3voAo8UgAORiNtBY=;
        b=38JYpUkTGOCR0MzWftEnX+cRzZF5j9zf4UvBmz4xVPRoJzW5Mr+buzwP9liu1AQbc7
         DW7L1EjQt4AhyyT/cw1ambYZrd9+ndE3pUy/lZfxxX/xCcBS8MdMGiZbXwGyWmMnbsp9
         zKK8u0+H9KuqqyxDMAhSOItee/J/rQbVrMdVLlo5nZjJmFp3qDBzCcwZ2tRo/6zi/Yut
         XRYMrT36QrOf+MosFLZzDiNTVdf3TwmBoookPKnoqiZi+HwPh4aiveZvgj97rKaHJ7lt
         SxbjkiwlAc9pVNZQNro8N5S5UGSCQ2oADrFvjVjE7225Fg3R9usAmPKaM3AK1Sx+mJIp
         rWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710914406; x=1711519206;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PZTYFP7cQrHabDLXpeeWZ0a2uWz3voAo8UgAORiNtBY=;
        b=h5Cuwegle+JWXovFct+/rqeNubaorEXH90PGgrRwIF2B0vaDqRh5FhnH686PDTQj7z
         KcmCT9aOmelVCx0ufZ1ByVD78r6frYJXmk5qBHfb7Q3HNZTfWyvF7P20jjOVWq8SxoMP
         cA37UEmqjjtXzr50vTM/4kMmrXCx8U3ZTiPVj5jq7KmwnvVF+bp6M1LoBrVeMxecrJmp
         5FuSpX7YWwRJw/BWwFDgRi8iP/QW4mBLhEfZ/55nPTIVWVxtKldaeuWHgKOfajU5IHtf
         SiW5C+H+DOdpjVoqQF86Lms1gVj+B8mkSV1pk2ybWNYjXqxcByWpDOcbAOLxHwetVwTy
         fNRg==
X-Forwarded-Encrypted: i=1; AJvYcCWnh0ZtbSMf9BdSmIjuCjUfVaW4IL5Dt0cZR4MMNCEO67Q44SthrbEWWjk4tiWj/37cv2RUFfJk3mnwaUJDFw86frmG2fD3NHXhVg==
X-Gm-Message-State: AOJu0YwFdQbb5OS/plVUyNcx5jR6jc1xYv8ocKTqIwi8Z89N8Tm22sij
	XGt3hRn4qYV9zFTj6AanArACuf5uiH90TatNaRgRtVS/CmbVVeZw12mQ/LsxNSPxOREtcjuptrv
	hSc2mzE3EvSuAHj5pbA==
X-Google-Smtp-Source: AGHT+IGYCsCB0GOLdbVb6ZF9l6feOq/JuFNhQzsMn2U3sWml6myhqGSZU7HKyFffXQbmV74q/yfh269FFwjduW+i
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a05:6902:240e:b0:dc6:f877:ea7b with
 SMTP id dr14-20020a056902240e00b00dc6f877ea7bmr1139569ybb.9.1710914405429;
 Tue, 19 Mar 2024 23:00:05 -0700 (PDT)
Date: Wed, 20 Mar 2024 06:00:03 +0000
In-Reply-To: <20240126075547.1521556-1-mengfanhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240126075547.1521556-1-mengfanhui@kylinos.cn>
Message-ID: <Zfp7Y9x2iOE_prpp@google.com>
Subject: Re: [PATCH] config/mips: support zswap function
From: Yosry Ahmed <yosryahmed@google.com>
To: mengfanhui <mengfanhui@kylinos.cn>
Cc: tsbogend@alpha.franken.de, geert+renesas@glider.be, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@vger.kernel.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 03:55:47PM +0800, mengfanhui wrote:
> Solution /sys/module/zswap/parameters/enabled attribute node
> does not exist issue=EF=BC=8Chandle zpool zbud initialization failed,
> open CONFIG_ZSWAP CONFIG_ZPOOL CONFIG_ZBUD configuration,manual
> zswap function by /sys/module/zswap/parameters/enabled file
>=20
> Signed-off-by: mengfanhui <mengfanhui@kylinos.cn>
> ---
>  arch/mips/configs/generic_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/gene=
ric_defconfig
> index 071e2205c7ed..14884df392f4 100644
> --- a/arch/mips/configs/generic_defconfig
> +++ b/arch/mips/configs/generic_defconfig
> @@ -13,6 +13,9 @@ CONFIG_CGROUP_DEVICE=3Dy
>  CONFIG_CGROUP_CPUACCT=3Dy
>  CONFIG_NAMESPACES=3Dy
>  CONFIG_USER_NS=3Dy
> +CONFIG_ZSWAP=3Dy
> +CONFIG_ZPOOL=3Dy
> +CONFIG_ZBUD=3Dy

Any reason for choosing zbud over zsmalloc, the default zswap allocator?

>  CONFIG_SCHED_AUTOGROUP=3Dy
>  CONFIG_BLK_DEV_INITRD=3Dy
>  CONFIG_BPF_SYSCALL=3Dy
> --=20
> 2.25.1
>=20

