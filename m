Return-Path: <linux-mips+bounces-2350-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79B880BFB
	for <lists+linux-mips@lfdr.de>; Wed, 20 Mar 2024 08:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA2DBB21F9D
	for <lists+linux-mips@lfdr.de>; Wed, 20 Mar 2024 07:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B5520DCB;
	Wed, 20 Mar 2024 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y9Lh15To"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312F1EEF8
	for <linux-mips@vger.kernel.org>; Wed, 20 Mar 2024 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710919708; cv=none; b=fqiAGZJGcCxGaXHfmbEVg/FawH/JtMdU3PeCzWBIxGBWu8/ObST7UIAzYVNj9R+zJ0m5hfbCzq1UQqAaRjoOVbgiw19/bvCNuCnT0yf2tyAsp7nXH0Dij3MpwHHJkTSM74jo4HeRsBGUmpQZHJMB8+aiJBbDOAdkKCPxadtQlQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710919708; c=relaxed/simple;
	bh=li2qAWghidOrmM63QJI/fv2vk+a/4nCE+jxZRIXe5LI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nm1w4fxHdYJWA0hP1uEnF5Nz5RpdpMKG3Az9eqxkkVARPGrDXBr2S9RoHCNk+KvMmAWpF+40QLOK16sQH8rl7GZf8rbt+FXcThXGea3kRXP9xIvXbzNZ+/vZkaR650V1+GqQ44GN319KCYz7jaBSxtMoa1M7ReOFzBtE2gSAqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y9Lh15To; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so9035039276.2
        for <linux-mips@vger.kernel.org>; Wed, 20 Mar 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710919706; x=1711524506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Cf3z+01pPTqaJgUbHcUbvvHLevh6MiiirhgfJW0FB8=;
        b=y9Lh15To1TfRvFZBWjPg/GOflL8Lh5Of0UG1tWPDlybxLIkJoLCPM1KJnAOoHUWHq4
         V5N6tt26EwvNsNC7+J1A0HHVedq6zDqZ/xzrFLkoSJyFaEfjgjRBIGYRzNS5ZqZdMkTW
         fjk7GGmtEk+UmYuX3AoX2hFxhYUvlNXesmVboLBrxxrf5xllzYXQe8amS0U3oZgX/wYL
         5bc1rskTxFoYT9LbpTwPLgImzUHTXopvZjbCbIWfBuILzwM7naNYXiNR/kYvnPa/l+Ij
         qwBNEY8cMPrENKhlCAPVvk3U4zY2NBYrkc0FuWgsayr1Iof4SScx2kpXr9UVIF/Jzwns
         u9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710919706; x=1711524506;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Cf3z+01pPTqaJgUbHcUbvvHLevh6MiiirhgfJW0FB8=;
        b=p/zluFbR8b+8j5jsUYwIAklKBMsuwXD85g8JfbXW0Z6vQ7/pauvN2LDfbJM4x/WgcU
         9Ivl7Ik7oaCk3nsoytvEH4jF8gwP/Xt4pJVoEEBfZ77fbuwk6CHEfutKlXJnr/5dYDwE
         ZKk3A63jpvXsDwl6/5HER1t59HkXadXtft2UFcl9qR6aKVBSe87PzgHZH4eFZPVzuuP8
         o2Fef/u5X4bAUsodU5KVhAPhfH07bN11SYqhz813T9q/aLqRtoF1LCThb7NqNF8NNlYn
         a6byx15I1GMK53kD6HTp8cf/px16NmKRc4q8myA8x6dDbkpxsxuYI7k5QusypgBnz8MH
         Ts8A==
X-Forwarded-Encrypted: i=1; AJvYcCWteUyOHDWBhzH3g7wkLrSRi7N9tEcrofQWSe4QWeQ36s58T9uBAODtpxYbCgfaWtOfq0krG0DixsMzB2eWCdBMkoLpdIkBWMYYqw==
X-Gm-Message-State: AOJu0YwOy1xv804Up0vlsIUR4Mdqkigy8b1MlC1sDILGF8gtfog+3VJ+
	Q1k1zgwNWzCvGQ4TNA+7gnRq13FBtA7tEkWkYgpgbHOpunNgzCQeYraewxtZ/3x3KDlO7GOeuQw
	NHH69x4+yxuP35PpHfQ==
X-Google-Smtp-Source: AGHT+IEfa9xOQhFmuNxE4o9OfZO2Vc/0uULHRYTxqzo99fLnSbA+gg07/JJm2omiBe+ZV95gvHGh1ZOhZxkIbXjt
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a05:6902:2290:b0:dc2:5456:d9ac with
 SMTP id dn16-20020a056902229000b00dc25456d9acmr992058ybb.5.1710919705944;
 Wed, 20 Mar 2024 00:28:25 -0700 (PDT)
Date: Wed, 20 Mar 2024 07:28:24 +0000
In-Reply-To: <021efce7-1e40-43a6-9bfd-0d968bfcd5a8@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240126075547.1521556-1-mengfanhui@kylinos.cn>
 <Zfp7Y9x2iOE_prpp@google.com> <021efce7-1e40-43a6-9bfd-0d968bfcd5a8@kylinos.cn>
Message-ID: <ZfqQGGfKStVxDwYT@google.com>
Subject: Re: [PATCH] config/mips: support zswap function
From: Yosry Ahmed <yosryahmed@google.com>
To: mengfanhui <mengfanhui@kylinos.cn>
Cc: tsbogend@alpha.franken.de, geert+renesas@glider.be, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 02:44:21PM +0800, mengfanhui wrote:
> Zswap and zsmalloc are compression methods, and kernel configuration can =
be configured simultaneously.
> zbud is an algorithm, and users can use that method if they want to use i=
t.It won't affect each other.

Zswap compressed swapped out pages in-memory. To store those compressed
pages, it uses one of three allocators that implement the zpool API:
zbud, z3fold, and zsmalloc. In that sense, zsmalloc is comparable to
zbud, not zswap. I suspect you are mixing up zsmalloc and zram.

Anyway, zsmalloc is the default allocator and should be better for
almost all use cases. So unless you have a very good reason to use zbud
over zsmalloc, please do not use zbud. We are trying to deprecate zbud
and z3fold.

>=20
> =E5=9C=A8 2024/3/20 14:00, Yosry Ahmed =E5=86=99=E9=81=93:
> > On Fri, Jan 26, 2024 at 03:55:47PM +0800, mengfanhui wrote:
> >> Solution /sys/module/zswap/parameters/enabled attribute node
> >> does not exist issue=EF=BC=8Chandle zpool zbud initialization failed,
> >> open CONFIG_ZSWAP CONFIG_ZPOOL CONFIG_ZBUD configuration,manual
> >> zswap function by /sys/module/zswap/parameters/enabled file
> >>
> >> Signed-off-by: mengfanhui <mengfanhui@kylinos.cn>
> >> ---
> >>  arch/mips/configs/generic_defconfig | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/g=
eneric_defconfig
> >> index 071e2205c7ed..14884df392f4 100644
> >> --- a/arch/mips/configs/generic_defconfig
> >> +++ b/arch/mips/configs/generic_defconfig
> >> @@ -13,6 +13,9 @@ CONFIG_CGROUP_DEVICE=3Dy
> >>  CONFIG_CGROUP_CPUACCT=3Dy
> >>  CONFIG_NAMESPACES=3Dy
> >>  CONFIG_USER_NS=3Dy
> >> +CONFIG_ZSWAP=3Dy
> >> +CONFIG_ZPOOL=3Dy
> >> +CONFIG_ZBUD=3Dy
> >=20
> > Any reason for choosing zbud over zsmalloc, the default zswap allocator=
?
> >=20
> >>  CONFIG_SCHED_AUTOGROUP=3Dy
> >>  CONFIG_BLK_DEV_INITRD=3Dy
> >>  CONFIG_BPF_SYSCALL=3Dy
> >> --=20
> >> 2.25.1
> >>

