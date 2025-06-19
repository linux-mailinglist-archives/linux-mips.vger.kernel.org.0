Return-Path: <linux-mips+bounces-9411-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1808ADFC1A
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 06:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63E3A7AC99E
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 03:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24DE21E087;
	Thu, 19 Jun 2025 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax1QfBig"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50C54764;
	Thu, 19 Jun 2025 04:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305655; cv=none; b=r5JQHZBruFxVD7ZofprDoNUvcAJaQNHWr8mjhHIyO1n+AhQlOunfC3DetejAyhq9p9ICHsp8oKkiP7UL5j+pxivIZQnPmREBgkkSs/E6iOO8aUeiWnP7BqkELvdoep1LNZ6kFC1HRvZYLmg1DHV2XbWPxkgoxjKP2QTs3IOdWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305655; c=relaxed/simple;
	bh=M72OOni9nuPjXpXI7PBkMS4QekjBamZtmQ/ypweMgrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJRKCNzULEhVjRJ0PXMKG94PyBCncn1CnSSwEqwB80ay3wqQSK5uMAal65WPhlk/cPE5mOvlqe8OYgBMNwFhsM2nwQMeyE4SRlph938RpoaZ6Gwlo34NUIkyuycSqBDLeiOcvkhRjvIjRYATprQDbnsdFYannbjyf2r0EHCMoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax1QfBig; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so463473a12.0;
        Wed, 18 Jun 2025 21:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750305653; x=1750910453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooLg2AVXWoHfrdwnF2kQOLZWKgxHASVc333apUAQwo8=;
        b=Ax1QfBigNk4RZ1UmJFVlabGnuUWLkpt8FdzOkop/1p3kq2R8tddTCJ7e9kqFnABpbJ
         wZbofp2wF5VGlm/LugL3yDgUwrjLAsV//KJPZlP5yV8aDooRre+EZHbgW0v7sW0QM26l
         02KD5xQ7QqtnR5h6DLvW4Cs3/npeQWRRBhH2cUYzlA0rLYHVYIrZ0cPbuNCzvMT+8By6
         QjmTYMv+tCtbYLaEpTPfcxBLGsNzMUsuHh4yVm21AT36+i4mLHMkxdd2NqyYFJUoObOe
         Ny5bp/ujmGsGAJaGdKuJ2AM///MTncbdV3/rD7097c44qqSGSyHnEBHetfpn/2BNwb6K
         9FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750305653; x=1750910453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooLg2AVXWoHfrdwnF2kQOLZWKgxHASVc333apUAQwo8=;
        b=HC057l4jmkoV5ZBlvGuiVKduwNK916tEAbCSeVL5LYkaOrm/Xn0aUYy0Vo1ZDnNwAu
         T8rUOdD2yuhPRdf4rcSct/6aUPqjf90+100O7qAsSEIXRfOZ8EjG0AYfMDjAO81aSUow
         sdsJjnpTk5urqYkrgwVYwLdi8kNjf113QpyT6rUhqTTK7rAS4hYS5smT7Vy6HDiM85dh
         0OEaRwzklN8UpQ5/lTm7SXvAyrchkwTjRufj7e2bxGMcafIQtg2s2+IjLn7BMg2C5isP
         4lLpJ0JnweKlkJkPjpny74mLKwll9fe2ltkxwW6BLtJx2FD7dFvUKjkCOecRbrh/PU6g
         vqwA==
X-Forwarded-Encrypted: i=1; AJvYcCWVImX9hhZoxvirqTstQnRmjorYHWoMyZ5PLGMgqcLVBdy1SKKw9QuquNuEby3iA8a7wHQ3nrhvPvPdpss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qdK1C/PgmcvQKomvq1CE7Tmo9ff7AnHzpSnKrmqoPqUwJ80a
	N3mPT8Xy+8var8BZoxctWLIqGSnY5pqhzopTQdW/QUb7Gk+bC8lvsx9e51E1wqbExaaz28Q84dA
	y9XgJGKL+DS+mEdD3U7hamyBMhOQa6Yw=
X-Gm-Gg: ASbGncsiNDOE8Fnb0nKuCP0KVhWKltLg6gpRvEoWniwMZ19WYRusd3qpuqMzWs9QeOd
	0N4we7A/srWCc9z/zVegW9MbZbgS0kaHc7FC4ooDWMj29QckjMc2fYo00MWTYaUYQVPbPg7qVvV
	NxtZorUzIA2o2Z958J6btJKqojDQOR0Qy/D8S4Mwj0T2uxe+48BwE=
X-Google-Smtp-Source: AGHT+IG4EU24MbNMPr1LqaZXbbwlqMD6VU21vOqudKWNrsgMI3HV8ZjJnMiFWZ6++l/Uxsh8s0fM9lgO7FagKkqrGHE=
X-Received: by 2002:a17:90b:264b:b0:313:db0b:75e3 with SMTP id
 98e67ed59e1d1-313f1e6f3fcmr32108934a91.35.1750305653447; Wed, 18 Jun 2025
 21:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 19 Jun 2025 06:00:42 +0200
X-Gm-Features: AX0GCFsl2J-hW1BVYjyXsA5gwVtQQxvOUc1dZ9TUS7d3oNWcCyLT-hblWsMnL4Y
Message-ID: <CAMhs-H-KGBumYbxojg-GM+bQPow4umM1va862o5_qEcDM2P1kA@mail.gmail.com>
Subject: Re: [PATCH 0/2] MIPS: ralink: some build fixes
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, John Crispin <john@phrozen.org>, 
	Mieczyslaw Nalewaj <namiltd@yahoo.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:40=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:
>
> This patch series fixes some MIPS Ralink platform compilation issues
> founded on the OpenWrt distribution 6.12 kernel[1].
>
> [1] https://github.com/openwrt/openwrt/pull/18654
>
> Mieczyslaw Nalewaj (2):
>   MIPS: ralink: add missing header include
>   MIPS: pci-rt2880: make pcibios_init() static
>
>  arch/mips/pci/pci-rt2880.c | 2 +-
>  arch/mips/ralink/irq.c     | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

