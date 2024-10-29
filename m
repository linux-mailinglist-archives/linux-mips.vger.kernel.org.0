Return-Path: <linux-mips+bounces-6543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60A9B4294
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 07:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C3F1F233E8
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 06:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CDE200CA4;
	Tue, 29 Oct 2024 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQ4eZuWi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0728E7;
	Tue, 29 Oct 2024 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184676; cv=none; b=biqdWmT9RFTXenwOThakQAHn/RQYSgDxfyCbkjDhi9creZ6MVSDj30FqXyWTm1Ga4E6NykTRUJtwIv3e65fRqPMSjE900EGfON8U1FuNnD2ve22jtgV25XfmEdZNZbngUy32mWLjyvQ7BRLVH8BpvQjG36uTbKmFlZ7+ur0rcmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184676; c=relaxed/simple;
	bh=LFP+NwF2L6GLAFWTLULKcpb0P0hCWjaYX4R/m+E/Su8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIvPbSSfA+koZZtxjfpnzE0ScEY6cHae4g8HDlKwQ3xm3yccWqK9qal0vACTQh7ynajjX5ehpJMINYzmsHp2rgloQlUjBj/uDekBf6g41Bq+TB7vLoLO3aSj9oZe5Z2wQxSx/yNsYlldjVYNFQ/SZuWFDZjhbTJVgQ8ajLFvt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQ4eZuWi; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e60e57a322so3004882b6e.3;
        Mon, 28 Oct 2024 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730184674; x=1730789474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GlOZAfHqu8HJvaat8yN7wrDI1PDpq59GahcIUpvy5c=;
        b=FQ4eZuWi12jODQ/o0e0KQH4tFguPajYEqC5SVDeysAtHVsLGzro4uKa/03KbanvzVn
         FqQJ8MGZfxfDdu++43DEEQVwm66rnBcJx+NJnDhg65TYEvTfXFmmNfBe79ZTdCJp9VbI
         sN5FzIIio/vVTLQ4ajjtuEYPCautop3kH2ij2a7r+uZ4PS6NDFgXssmapjlic/d1GSNB
         iCiEPb15WmMgD6G3foSkxRwJMUdAbOB0xchwb+7WVn8JeWpW8QunWiAhi5rr/Itybd7E
         fBWjZmTZHNIBRrtl4wyUA9YJn3uIIvCfo6g2bDBYAj2aSpkkXe9wOM9Zq4zwGsUdCVoM
         MPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730184674; x=1730789474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GlOZAfHqu8HJvaat8yN7wrDI1PDpq59GahcIUpvy5c=;
        b=u1f6Grsvcu7fK715K3YPMYPVGFyW9NasWhsTD2spQOXCE72qt3b0MTm/oI3iooDsE6
         WZYM4eZfIu8Y+RM67hNtqLxXkEoWPkOfAJzojMnWXL/dQD/BvnYS7CrD4bVTvrYCqZmk
         KOc2nj/fZJfSDY+3p7hz0hbiT6NRzuLQCy2sHaYJBMl6HYYjuwz+D+yqfziTL4IMaDPs
         LkXtI8dXs/vPDbsM19DflXSYf5wnKv8Nhyzx9OWlyj3hiO8PrRms5aZt61HDLt34yXJs
         GzU0/WXM/EgIxUMWIUT0zicfrQMrV2TllINzzFNlg9zDlyebmgAOLKJU7KI/rUHeptVA
         7J1w==
X-Forwarded-Encrypted: i=1; AJvYcCX/98GcpFDE+FIIY7II7HsJjTxPEB8GjLD8FwKYrVEmq2KWlISAUpQEJ8yEAoLDGg7UkWo7AiVW56Z6z7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAStv0OYJjrI39nTpx7DBGR5qjuGSXhGFxGjcX6jtdk3EligqE
	9Xy7QznTW3s9tT0QYqCNQIN/dDvMbNRf5OfzHbHssfp0idWax6RNPOMC7XzeH6ujiWHNRtv4z/m
	l0eLz+gtN2Fcb2L4h9PJEDd/7Hjk=
X-Google-Smtp-Source: AGHT+IFwtoeicmUCKAX3ff8fQ1dpO+VnCGWdzjhuO6xXSGDxjOKaFSxpg4FbYShqHbqdBBb3vav+xZtQ0f7F4QITBgM=
X-Received: by 2002:a05:6808:1394:b0:3e5:fd66:c16b with SMTP id
 5614622812f47-3e6384c4d98mr10636214b6e.33.1730184673991; Mon, 28 Oct 2024
 23:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028203643.191268-1-sergio.paracuellos@gmail.com>
 <20241028203643.191268-2-sergio.paracuellos@gmail.com> <fe3e80d4-9482-4df4-b6c4-f903a83a5cfa@linaro.org>
In-Reply-To: <fe3e80d4-9482-4df4-b6c4-f903a83a5cfa@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 29 Oct 2024 07:51:01 +0100
Message-ID: <CAMhs-H_5q=aCb1e_+7t7aot3G9jnY3ghtUG0GmJckz0esmLu=g@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource: Add Ralink System Tick Counter driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, tsbogend@alpha.franken.de, 
	john@phrozen.org, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:16=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 28/10/2024 21:36, Sergio Paracuellos wrote:
> > System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
> > driver has been in 'arch/mips/ralink' directory since the beggining of
> > Ralink architecture support. However, it can be moved into a more prope=
r
> > place in 'drivers/clocksource'. Hence add it here adding also support f=
or
> > compile test targets and reducing LOC in architecture code folder.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> Applied, thanks

Thanks a lot!

Best regards,
    Sergio Paracuellos

>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

