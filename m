Return-Path: <linux-mips+bounces-9412-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B444ADFD33
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 07:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 264F83AB4D4
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 05:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C1B244665;
	Thu, 19 Jun 2025 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nleSInXc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F11244186;
	Thu, 19 Jun 2025 05:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312018; cv=none; b=oprPJYrsBCiv/RTkgS69uLdeN0xDgzs3JH+0QojeUqq2YwF3aIWHkesprQrpW6oev6fLG/rd/eO/cz/LlWCstuedoDw50JvQnZozw3dEHWMBJw8TPbIwnQ2J+k0rblIqUvyxPUmbtV+dwRJrruvBbnpOCNPKnIFCYcvnG7VHWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312018; c=relaxed/simple;
	bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFQusyRm/qoENhbJ1zUOJP89HlIC9BVKSq7XqjJGVF/5q48QsY8TsXw15bfKw12FyUGwpDz5v9PM31Smfce9+xpyPtqu7io98iyL/ykXm3CYjrg/WTs7AKyY5wLatICPe4ul6ALJvTzbhnrc8H+nVRmPwQvAtOqC8vqwOeqXTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nleSInXc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b51f5218so336205e87.0;
        Wed, 18 Jun 2025 22:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312014; x=1750916814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
        b=nleSInXc/HUPMcw/3JHgca1CcQ4W6TIYZMdmgEH1nVhrLpznuoGtq1o7EJ+tJohvs+
         au65demM4JRUGacovfoBZgwk/OmVB8r9B/2fPkieDxcZgbQkyGdJFwZ+pxZLCqZINlBR
         zdQxmHikU85RcLBaUlBcD1g2norMJXn6tZYUflYdUIq6lnaupwvVPKoyHCNz9e0NeOIx
         e2BPkJrqtnI4EWzX2ARmF2+ArQbMNZp/ARgc7aJtQMeIYaa4a8LbxUKABaGqHHY8Iqb8
         0HjtQxXyFD0G5S7HptOxXpD13naj+NvpyNqQQib9sVL3jwBp0QIDr8ubI541iAmnMdEK
         RRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312014; x=1750916814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
        b=MuYgAJRE3UPL3mwq3G5FIBItsUZ67Q/eNg0JWA7e3t/ANRuK+IwMwQtK7R8MvU/A9q
         J01XyGAu0+E7xZxba8MF5G0XsCYpr4uRq0Rpg9MLfRHX9y2wg+3kMgt2mWa1n0lMHvjj
         Fd4sGrc/3uwmPnLfEl5VhO5sX+7fjXDC+ZGrUKTe8gTYMvbi5PSn6TWsRruNSjRkzMhy
         0rT3rtT5qaucqITgQnB3VyEO5Sw9O71jpqLl3ikj9vSdc8bElrBZHRrxBsWVgpsYzDs4
         yXrHlrN+WpdEGD+m9wpmDQcbBLRRKFwNMb6hCNR+lnhFhpJ01oMq8g2cPX7mVyPkWjdE
         ZdOg==
X-Forwarded-Encrypted: i=1; AJvYcCW1pwg/tY6P2rotGMcfExjX2I2HSRJ4qI1uECvmvEeWfQ2H3Yrmpw7YRThK9nJ57aPX1hyOL0Kf@vger.kernel.org, AJvYcCXbbwA2rmWnFSxDAdA+Gf5JfdaoNAE9MQxLyFs/Op55ZxP2whjiw9xZ18uAN85w16f38s9dcemzkPvN@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVv418cjn1Udf/NYyPxGuK6qBu7XaWOqvVxQS6a73YOlU/tU5
	WR4KW334NawtKFBCKN0OmIw1HWHwOLQ3nLqDDrxk1OnVeog7ZieQn2pbL8bAt7leYrvi6cQ3vRK
	Mm87ME6e7KHAJZjQrPhogudhvVWL90dA=
X-Gm-Gg: ASbGncucmLZ+y/7CsE5mO1ZlXudQQcUH5wl3P7kLfcjnSdVY8OBoLjT7uBllB5lYKhX
	dK26cUBZTy04vvNwl2i2k9DahlsivsoNyQPDU6hvHjC8eS6Lo60Lz0IjbrY/0aPB5x0LiJCMTkL
	5TJC5ut+9NlRdFoS2bHoSP/vW/x/JWNO4lwkxjcuqToH8R
X-Google-Smtp-Source: AGHT+IE1xPGt5ROVV8f70S5heb5S4gN/anI8tPUvJGRuJeXPD/dBLegDhxqjDN+fi/v7qlQqJzYLlHExWELH2KyeXss=
X-Received: by 2002:a05:6512:2114:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-553cf7d7475mr2149020e87.33.1750312013519; Wed, 18 Jun 2025
 22:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
 <20250618183333.GW1699@horms.kernel.org>
In-Reply-To: <20250618183333.GW1699@horms.kernel.org>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:46:16 +0800
X-Gm-Features: Ac12FXz2MfdvF8WEisDdVYaJh-GTBO0QM7RElK1s-X1101O0wUuzCnLffKUuZmw
Message-ID: <CAJhJPsV2moLRZji4pPxLoV6=GSdVsfXPDt6rkhKHqO-eC-X79Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data struct
To: Simon Horman <horms@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 2:33=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> > Provide a structure for match data rather than using the function
> > pointer as match data. This allows stronger type-checking for the
> > function itself, and allows extensions to the match data.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

--=20
Best regards,

Keguang Zhang

