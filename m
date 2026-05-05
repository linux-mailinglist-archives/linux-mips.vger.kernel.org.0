Return-Path: <linux-mips+bounces-14459-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMzSL1j0+WkOFgMAu9opvQ
	(envelope-from <linux-mips+bounces-14459-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 15:44:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DE4CEBD4
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 15:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E86D93003BE9
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 13:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B247CC71;
	Tue,  5 May 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQsa9WyE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B847CC63
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987905; cv=pass; b=q8NcoqXGzaZ1qsO4yU5YqEE+P9h51xppejVePUzaBq1d18Q//Nx6WrWrW3GQkvNjgNsxk5RShGDJ3GIPbi7JC6ApWKfiW6mg1ov+wfDIAhDQ70/cXZyeDBr523xQL0QTPZh8//JVc0x5Ci8DkzvAegzWauSX5D6c9Cg42pwv84Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987905; c=relaxed/simple;
	bh=8wyn0Ofwpqy6SU9O+WfUwbSmjX2YnG2tpyA8T4IqcZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJcMmYhYtpqMeBtLRS9v6juLD3wOz/BwrGPsIPubJDcRgKKHw8iYp0f5BfS/LfrnBbzWUd5xSMl+dwTIOXGWrVHiQ15Jdjj/qGrLX5VskjS3sbDUNQAxXr2YpLRg0NF5qcPGK+ra/gNKW7orF00Zo0ftxFiifvXq03lUP35wkJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQsa9WyE; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so3862610a91.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 06:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777987903; cv=none;
        d=google.com; s=arc-20240605;
        b=TxeFyPoYfZGsPhbhle/stsbOSr2oXdteVby5lL4z/mIIx622+LDYiR/DqGhg8STDyi
         Svbv1Qdug65J8up/7Wphcp/leapSFlmOZIc2d2XER3f2pLOnYialoBcC5zjdr/gTf7x0
         VkyGl9TuX9L+uHbHFtDAPZ+kwrvacW3+V46xoNh13VzahUuMRlJbq0Xupt4I85yMBTst
         IAu72zr7jSw3C6vbne6ewu1wwQKSIObWiXKxQttvryY0MhTIn507YKva2jBJiaANmqKa
         4Yeoz7emsFhhie7Z4qnM2icIEiBzsDZvU7c4PyYitiLGoVYwDpeHlLZ2icF/dQZ+c7wh
         MIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jjpUfORVM9bwi74VcEXUjDBp/dftjttC37XxZf40nUQ=;
        fh=XeE9pDWSVzZM1o63qpibzVrKLGGJMxWM8r93CoPAdP4=;
        b=FwpVporXi54rE7wH25odQus/b+tqs9kiCIKY15qx649u0ygbn+rybaV2gwbPbp+En4
         mBwNjwJxZwzkk0vD6QOLe0ixeO/Cn8i95uFciOE5KHJwTxVmBEWlFpg6ZBKu+yA/HiL7
         q+0CkSmgLcctF3f+XikBcGs0yFBV+wjBgr4ZgpmlOaSMUD3+vhZnardypnFHu8ns4d01
         +JbmFswFDlEip8uIwv8RTlizELjw1y65a6Gs1RvDNvECdnvsE9834MaNG8POUXcszMRO
         ++69OBWE3AkEkkIjUjaV3M5oqWcR99q2BOuYi59wb6CLAt+m/HRAiAbTA8t1f6prwbO1
         ygIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987903; x=1778592703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjpUfORVM9bwi74VcEXUjDBp/dftjttC37XxZf40nUQ=;
        b=XQsa9WyEhBMgkkfroQFjaGbLsAJBUhH3Rr9sS+3sZXg8WQWVfSfIRe7Y8Rie682wAK
         KABGjAepK80sTVaIfPMPVG3eXOff4o3Efp16iuhA6pMRE173o7gII+z7q/KpPjD0CtOd
         v7pJVchYH4qe6N2YAe7uOSmlQVokbSUWrhjJKalciCvxf5VdeNuQKk5GFwA34/C8N+43
         oQUkgCPoxb37R2VRN++Y1h114TKSpzRBkYfx49ON9WtYMWn4VNbWm/IWEiTHGsswSu9J
         2q3kbNDJuqcRymLEkZCnFlXQJWK+LDCs6M7lTw6Gy9ViIyd/+EqsPw3Z89ZX80QBTO50
         9Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987903; x=1778592703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jjpUfORVM9bwi74VcEXUjDBp/dftjttC37XxZf40nUQ=;
        b=O9U4Gjpc3Gpu4dTBQW6bitCQbM6OamoAE9JBlbLgk0dCp0FEkTXK6E6ZB9rjNhxhV4
         ME7jJM2XbZYRFC3tMzyC+iCxBZ1G1bGE4xpyeJaWAIt6GEPYFjtwX8/1F0VE4Dn9Uank
         sIii/FqwJSpsloN9Pe6qxhhm+FHh762pj8IATADxRRGhMu9fbnwU1gUdC8EGp7i0p8Ir
         xsZmKgqZZAItWPB2nqnmKfVb+ZfiqKe6L6wMTg5Htpbpv7IpxW6983uwhZoZzmSZBC8e
         UKThKaLsJF6FyPxt8wRO+ZAd/PAjQJQIxNrPGalubQj2UjAX+qQbfie/VbC8hUSTVXYR
         SlTg==
X-Forwarded-Encrypted: i=1; AFNElJ+tTYcdgMpfR7e7WsR1YmADiziCfuVSgBf+mLTi44/3MLUCnhM9Hg0idi1fT33i1eqqN9ueltzpGqP6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0eRw6sXp3S5vdJPsCo1ze08zYGy32jh/L3WQr4ybBOKsMT3U8
	t5FtGBUdGuwv6Owpi47jL/A1FDdxTrcDsdn1S2wkUzEn1UfvscWdrhra8dKuhQqiMYl0LiQc8/6
	YMwCIAAP978wZjsdX10DXnwsH3n9dH2s=
X-Gm-Gg: AeBDies/pv1ny74Yr3uLLSh9o2Zk2ghhnjXlf4NzAH18wHykEYlZai+2iyO/BJaOF2j
	bxTeBLca6rE9ouxQY4YKKhcdp4pf8F7uhBAKoBZX1TkmP9qzSvH1Jegyeo2D3zpJLc4lDm+eFtU
	R3/m5C2GfQvVY3npHx1VlrIw3eWU7X9NL2yAOTZPFVDQKcwA1/msKUJl4ph/OTerCpsarPvVpEy
	W2UZHrTtU2cLUwDwXaU2d05wXa4dWQuZvX0Hn8HVived67KJ4T5GpdRy/yPuA/yB0Fv6aRmprYM
	uQ9a729oYLuecsOanyhO46e0ruhQD+OdDWR9VE5L/lYHUaC2TwYO
X-Received: by 2002:a17:90b:57e6:b0:35f:c5cd:cc5 with SMTP id
 98e67ed59e1d1-3650ceac42bmr13290094a91.24.1777987902669; Tue, 05 May 2026
 06:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Tue, 5 May 2026 15:31:06 +0200
X-Gm-Features: AVHnY4II_1s890yTOuGHFMuESD1cokpVnHjPlv5ldMdFPLoza5WCBJYGhIVq2uA
Message-ID: <CAOLZvyENGzU7NqedQCfT3dcchUJjxRr-WJWC4ubqViLD6yzTUg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 034DE4CEBD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14459-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuellauss@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]

Hello Bartosz,

On Tue, May 5, 2026 at 11:09=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This series of patches updates board previously converted to use static
> device properties/software nodes to attach and use nodes attached to the
> respective gpiochip devices rather than simply defining unattached
> software nodes with matching name. This is a requirement of newer
> gpiolib code. Note that there is currently a workaround preserving the
> lookup based on the software node name, but it will be removed soon.
>
> The additional 4 patches convert the remaining 2 boards to use software
> nodes as well and fix some build warnings.

I have run-tested this on the DB1300, without any issues.
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>

Thanks a lot!
      Manuel

