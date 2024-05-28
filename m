Return-Path: <linux-mips+bounces-3355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D058D1E5A
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 16:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09241C23093
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 14:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EE116F270;
	Tue, 28 May 2024 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX+0u/Yo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0A6A8A3;
	Tue, 28 May 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906007; cv=none; b=aFsW1mqh842custE3iw7a2z22wMsbXf7JXep/DDGmWYX43jtbGCJlGsMX9qFlzw0q/WI8mNS4vdVLtGULCS+FGmyf+cPnzD6/3poizGhsQkt4raiLdqRer2HouFVDjpWLSQqJrBZmQf1txPjS+E9/M2tyjVB/ScfqsP4ax5KtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906007; c=relaxed/simple;
	bh=bpQn0hcSQW6hPE3NrOFr46vQiIynNIQoCqQvX6ZahE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLAemgpyEm6t287UtZSVBhggWil5UNwU3REkiRLxZIzcEDzp9CPDdw03jlf8pNW7hIYzfwwrx3cgZ9IfgTkd5PrFILX8VGse6FRMpwo3eBpIY6AHZtJ5qM5nWRu+1BHIlwXzBiNNE/ajEhn3LW++zFMsrpJBTNW0gFdWFEbVR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX+0u/Yo; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d1d11cb556so293626b6e.2;
        Tue, 28 May 2024 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716906005; x=1717510805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmcnOFfWuLtl64aa9TIaj9hn63sQ/KKgzde61ukyY2Y=;
        b=RX+0u/Yo7mvsQNthUTkAgUO2nhkiDF0RZRpGf9lF4ymFXuVn61O6HR/aM6HRJ0JIWS
         OWkBdi/VdUeXyR16nL9Pp/clv+/8JKAjJsqx0EsFl10kldtoLbxpYHIsxAxEZHuJwkLX
         G+c4k4DvrqywiwgpW0hftdAunRhOEWktbNwix/OWdsenQmgqFdNWqB3wSCNtOb6ntDHr
         Woq9l0zjnZI+xe8nBupULbnjpABpRKkP5tteo0TTIUlXYr5aT8mqp3Qyy5xYG9pKnUGS
         SlJIj8QajNBcgOwtKeXlQF/qsbCRav6BRPiLaqMoQZIn3xuk4o4pTMnDLPm7ZNq8ae2V
         e6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716906005; x=1717510805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmcnOFfWuLtl64aa9TIaj9hn63sQ/KKgzde61ukyY2Y=;
        b=HhQcYnJ5gPzexm4bRIcziWhDQPOFd4YsRrIPdxvWXfnsjwRwaTUZJCyNEGlRWQE7KG
         KF0cmMNSP5F7fyB1jzuUYZ49doCSqWPLNEo3fwfu2jd40Wzmc82+j0be1bQVRA/4E90Y
         mOVdZhKFcF2+c7GT+iMPG2JO3rcyVzxgd3rE9eWArsxjySCJiTQGVsubJM6uor/YpS5m
         BcFQapYPiNhcHQwaEhtiaDmmQriGxetTkGS7MDfRmkvHowF00uFtt3mHR/zEUXtlhfOA
         2yRk54XRspL0wDPklxa2FgRYO5wAvnSYgCGkQemA3hCRXtQjdOBwXkTEMLxlUJ8a4M+C
         kGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPmwvsO/HHH69uBmRizx5ldjQbPCJFquOjrSZpv1Qg/N5BvvdCl/VeGXXAwIjWaZ/paimpbz3MYj8wbLt0hoQAiQPUt2Kg3R0ady/7/MJ0dJ+QKG+/Ko8Q2dEMrjGkGYAA9hRtk1ZaJCJWX0X/r2PdJLO1CdS36WtnlUDh2LWkXpjoPlM=
X-Gm-Message-State: AOJu0YyXW33Dwjy2tYI5MDObrmrOnQomDQzqUIPmR9dp+Bwr3gck31fG
	4UfCwg94bxqH6s6lfeiHb5HKR5K9apnY6izsy6fakOcJGFeHaTbulYJ4HcR9676H990SA+CqVi/
	Z/yOf5j1QzSBJWBeHb9EsMtDp7Qc1AQ==
X-Google-Smtp-Source: AGHT+IFf/tGif+N88k+BsDHerrioFJmSg7BKXYE2WrzeXw7pJ6A8L5MSkqM1O+Gw60tDphcpECwn0p6PAbc7rdEiELA=
X-Received: by 2002:a05:6808:1a01:b0:3c9:c4a3:41a0 with SMTP id
 5614622812f47-3d1d0ccc89cmr2138642b6e.33.1716906004937; Tue, 28 May 2024
 07:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla> <CACRpkdY99LACAUsg_S4ww4U7-KU_EtkLZ+c8dsa0M85i9eJZbA@mail.gmail.com>
In-Reply-To: <CACRpkdY99LACAUsg_S4ww4U7-KU_EtkLZ+c8dsa0M85i9eJZbA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 28 May 2024 16:19:53 +0200
Message-ID: <CAMhs-H-3yM3sLvgtOn1KWPF-Ch52hqZZXbFPe2YP=xgFjZLDug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: Linus Walleij <linus.walleij@linaro.org>
Cc: liweihao <cn.liweihao@gmail.com>, arinc.unal@arinc9.com, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 3:54=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, May 27, 2024 at 4:21=E2=80=AFAM liweihao <cn.liweihao@gmail.com> =
wrote:
>
> > From: Weihao Li <cn.liweihao@gmail.com>
> >
> > The current version of the pinctrl driver has some issues:
> >
> > 1. Duplicated "gpio" pmx function
> >
> > The common code will add a "gpio" pmx functon to every pin group, so
> > it's not necessary to define a separate "gpio" pmx function in pin
> > groups.
> >
> > 2. Duplicated pmx function name
> >
> > There are some same function name in different pin groups, which will
> > cause some problems. For example, when we want to use PAD_GPIO0 as
> > refclk output function, the common clk framework code will search the
> > entire pin function lists, then return the first one matched, in this
> > case the matched function list only include the PAD_CO_CLKO pin group
> > because there are three "refclk" pin function, which is added by
> > refclk_grp, spi_cs1_grp and gpio_grp.
> >
> > To solve this problem, a simple way is just add a pingrp refix to
> > function name like mt7620 pinctrl driver does.
> >
> > 3. Useless "-" or "rsvd" functon
> >
> > It's really unnecessary to add a reserved pin mux function to the
> > function lists, because we never use it.
> >
> > Signed-off-by: Weihao Li <cn.liweihao@gmail.com>
>
> The patch looks good to me and Sergio: patch applied so
> it gets some testing in linux-next.
>
> If Arinc has issues with it or something else occurs I can
> always drop it again.

Thanks, Linus :)

Best regards,
    Sergio Paracuellos

