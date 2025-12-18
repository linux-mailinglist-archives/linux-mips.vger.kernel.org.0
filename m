Return-Path: <linux-mips+bounces-12516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C424BCCCC26
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 17:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C026E3027CA5
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F58F366DAD;
	Thu, 18 Dec 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOrYbKyM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED084366560
	for <linux-mips@vger.kernel.org>; Thu, 18 Dec 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075368; cv=none; b=YiTxXmSxaOdh0WnGai7ehOgKUd/4LcqwBuZ7upf0oDM4H5Yt0+CmqtfjULT4RuJuKFNGIdXqgCgMFnQjXSfOb46iwSfhHbxQK+CcYYHUd+LOw4Z6yMRL1tqQo1lmLDGoYWMbxzuhpnbpPuzJJDUDXjdAxS+MrtHLyk5/VUWTWfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075368; c=relaxed/simple;
	bh=zXX2/NiUfkloBnXKh4lMbliIbzAn7LdSq2fbSJlmbS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTJaNoHJJp94KgJgKRmQbC4qu5BdpWpqF0DKgr39lV9A2uiREspbPdJFNl/KUMoDUAXznMrxT233aTtKqc9nd9Dp6FwBef99USRTjSiO7mIk12mrSdJtzQZld4SPxFLi+SSO4vIF0A5QcP5Pr+3NJ0Iu8YlbdQfRcKze5PWBstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOrYbKyM; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-657509d761dso431381eaf.0
        for <linux-mips@vger.kernel.org>; Thu, 18 Dec 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766075364; x=1766680164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMSbry1+P/RNP4K+kKiw/SAaU8hSKKePZ7aYLlJ/2Ro=;
        b=kOrYbKyMd2wZymPsuzAKT6xrOvB4aJzZjNSLJWOTzJJ2PVkFASLC23EEaVV7ebm3Pm
         XPHbpFxM1Ede9y8XQKTufZVArc7p5AwbcFaOaXAzmpMgSrn1Oa0uiXjVMRm4/vT2PY0Y
         y7Q6RzMmmNa2VbyD1sRj3+1bhHkZzRqewdpVMCCm1jJH+CAWgHmZEw3igmL+YoDu9nEf
         B8BcciPRZupYwiCR9e1It7WL/mw2rfj73Cx9Zm1gYN7bkkvJ/5oRCWZ2F7YOININuEoh
         uTX5bqd7xV/QHl+7TAXaN/hRQtAFJM5xvHVV7QonO6eqnOrFV/76ZIz9uq+hMdDE61bw
         FGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075364; x=1766680164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMSbry1+P/RNP4K+kKiw/SAaU8hSKKePZ7aYLlJ/2Ro=;
        b=B0znRg3C6lqfX9DzVq89ZfYQdkmmPzQrPvjXMlGY+ezH28LEF4sBX9lI7UBH89JdSM
         sLl8SziSHyHWIkMEGfLDX2p5Fy3xHV1TGy+8fXE+cyXHOXdQEsB/ZG2jdTh9cyYauMOs
         XWoicVt38mx+HvvuM/vzt0rOqqbIHG4kvlSfq1jyBaKCPcLbhCHmKd7rynX2OR5JAQS7
         HKTb5SYQw5S3toSJoW3XE9X6VeB/wV5g84XcNDv4gUh/ytkEyjF/JSrTYU7Llf3hD3JE
         aOURdOcwh2UeBdKifUW5qv/M5yoqhXdVSmgE4TI2RfSEw8/7xWgpZIVJuFvijLVNb7TB
         auIg==
X-Forwarded-Encrypted: i=1; AJvYcCUDRRt5vFoYI2vsk29PtmOwbGXTICFpfrjAGg5xLn+vHB5zUjzjz0l4FajgDQ0pEG0DbSWsOfzIgUMo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ogva7XWvL8uA7HREcPwukplM7fr4iaU2FQxWpHyvJPHx29ly
	Mmt+n2kF7rdrDvHYPwPBJUNWQpISwWh2CkZncJrJKxaDaaI0u6EhSYI079Jv4dM3dtZxcg3R5FV
	5Bcs4ngJcv05SH0G0VYpm5+HmUi8oSnjuswF+iR5RHQ==
X-Gm-Gg: AY/fxX5UQOxgDeC7HmLR73fY+2gAGMO7QePgpQREAQJMPgHZLnpsXXE7rlMsR5egomO
	RAAEEk+Uf/o0Hs0Tuc6xrbjPucXqgCN4Wc2z6UjcFhZBBbxkh6BiQ2UEhdlbJIxXTUMvDnS4Ck0
	3BkR1jeK8xn8vD/jlqVk41eIgkz2Azof0zBh7TP2oMTmUlAM1N5T+E+XkRv2WmjoU/1ikMSegiC
	tXVIkgDCl2tTi3k7DfsegFDpb2NZZnZFWmek07kjeTNi0hIcPKhy1XaveemrjE9zYoYcK85QndF
	rdpHK+gSMIQN6Ae/3xcVwQ6YIg==
X-Google-Smtp-Source: AGHT+IG4Ae8pfu7GZWy4M+xMepW+pZBXhOq0aMMfvpQMcwHosUK2iqdP0ZilC2IC9nPL0ue49M44wROrYBjFkfFnq4M=
X-Received: by 2002:a05:6820:6389:b0:657:4e49:83b7 with SMTP id
 006d021491bc7-65d0e9fe36fmr11432eaf.1.1766075363719; Thu, 18 Dec 2025
 08:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com> <20251218135332f323fa91@mail.local>
In-Reply-To: <20251218135332f323fa91@mail.local>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 18 Dec 2025 17:29:11 +0100
X-Gm-Features: AQt7F2pA2I_HJOEbadmjsOrYtjrxD8lxVlzGBd-sNqyaYCgybyYAHq_YVDlH-Pg
Message-ID: <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 2:53=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/12/2025 08:21:27+0100, Jens Wiklander wrote:
> > Hi,
> >
> > On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > Hello,
> > >
> > > the objective of this series is to make tee driver stop using callbac=
ks
> > > in struct device_driver. These were superseded by bus methods in 2006
> > > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > > methods.")) but nobody cared to convert all subsystems accordingly.
> > >
> > > Here the tee drivers are converted. The first commit is somewhat
> > > unrelated, but simplifies the conversion (and the drivers). It
> > > introduces driver registration helpers that care about setting the bu=
s
> > > and owner. (The latter is missing in all drivers, so by using these
> > > helpers the drivers become more correct.)
> > >
> > > v1 of this series is available at
> > > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@bayl=
ibre.com
> > >
> > > Changes since v1:
> > >
> > >  - rebase to v6.19-rc1 (no conflicts)
> > >  - add tags received so far
> > >  - fix whitespace issues pointed out by Sumit Garg
> > >  - fix shutdown callback to shutdown and not remove
> > >
> > > As already noted in v1's cover letter, this series should go in durin=
g a
> > > single merge window as there are runtime warnings when the series is
> > > only applied partially. Sumit Garg suggested to apply the whole serie=
s
> > > via Jens Wiklander's tree.
> > > If this is done the dependencies in this series are honored, in case =
the
> > > plan changes: Patches #4 - #17 depend on the first two.
> > >
> > > Note this series is only build tested.
> > >
> > > Uwe Kleine-K=C3=B6nig (17):
> > >   tee: Add some helpers to reduce boilerplate for tee client drivers
> > >   tee: Add probe, remove and shutdown bus callbacks to tee_client_dri=
ver
> > >   tee: Adapt documentation to cover recent additions
> > >   hwrng: optee - Make use of module_tee_client_driver()
> > >   hwrng: optee - Make use of tee bus methods
> > >   rtc: optee: Migrate to use tee specific driver registration functio=
n
> > >   rtc: optee: Make use of tee bus methods
> > >   efi: stmm: Make use of module_tee_client_driver()
> > >   efi: stmm: Make use of tee bus methods
> > >   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> > >   firmware: arm_scmi: Make use of tee bus methods
> > >   firmware: tee_bnxt: Make use of module_tee_client_driver()
> > >   firmware: tee_bnxt: Make use of tee bus methods
> > >   KEYS: trusted: Migrate to use tee specific driver registration
> > >     function
> > >   KEYS: trusted: Make use of tee bus methods
> > >   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
> > >   tpm/tpm_ftpm_tee: Make use of tee bus methods
> > >
> > >  Documentation/driver-api/tee.rst             | 18 +----
> > >  drivers/char/hw_random/optee-rng.c           | 26 ++----
> > >  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
> > >  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
> > >  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
> > >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
> > >  drivers/rtc/rtc-optee.c                      | 27 ++-----
> > >  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++=
++
> > >  include/linux/tee_drv.h                      | 12 +++
> > >  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
> > >  10 files changed, 164 insertions(+), 138 deletions(-)
> > >
> > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > --
> > > 2.47.3
> > >
> >
> > Thank you for the nice cleanup, Uwe.
> >
> > I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
> > tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-te=
e.git/
> >
> > The branch is based on v6.19-rc1, and I'll try to keep it stable for
> > others to depend on, if needed. Let's see if we can agree on taking
> > the remaining patches via that branch.
>
> 6 and 7 can go through your branch.

Good, I've added them to my branch now.

Thanks,
Jens

