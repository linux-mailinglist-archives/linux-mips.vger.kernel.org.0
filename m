Return-Path: <linux-mips+bounces-14159-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOaBKe6m32nQXQAAu9opvQ
	(envelope-from <linux-mips+bounces-14159-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 16:55:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCD4058DD
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 16:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C66DB3020EDB
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C1D3D47DC;
	Wed, 15 Apr 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyeJG2YC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3963BD64D
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264867; cv=pass; b=NNP0Rg/FO1k5FwtWGUckJWHldTcnz+qJ+lNqBgtx9AW4bJDgFh1+TIpFnxPe0CZ6g486B5QpgLvGgp2EPDatHbJDISWChsEI2TPdaglrJMIDBg3M7xRXVH8mV9s6YMX7NZfcN/9LGVTqrY3fxW8aW+aEWr1c0L2VTI1hAwzFIe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264867; c=relaxed/simple;
	bh=1FmkV2LWMuaZfhbD5FtwEBtx99sGRwi7IC6H8W4R0jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Isf0og1DyVm24L1taApUPU+mhIrnLD6tF77J+OmQvjNa6NWSvd/otk1br+aXJjUcg5wGDUDmsCeTjuI2FtiNDfXrcsrak76aKfczIzQpO3wMFcmUftAe2Lw+AFnYb1qPvqmnQ1A5I/j1fPTQh3r5rBI5TKI+7Sz1FcbZn4X1cJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyeJG2YC; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7b4ee3a88e1so22150417b3.1
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776264866; cv=none;
        d=google.com; s=arc-20240605;
        b=B+YBDv7E8AMDCCN/LEwkpFToIFlcH7mxqZPJREGcoiLclseaLUApzgmf+IIqi7kXar
         ZChYb/TnLKb8hf4F3jda3W0Or/LbB1/5zAR7pOFYtwXRYTJw9tXQ4P7gRfmdVX/zJHy0
         +3r4qQ8Zw6IP/b44pBy5EQL7KFpaxrnh6VGRM8XJNsnC3qYxa+ZMuqRyN2TQLgpS2bUa
         gFTIcL1TotAQTXXyxCQffA+qzZugTdJKIyoa+UhCZ8U046NtekKUbLxyF3UZ/2BU1g2K
         n+sHlDy9MjaC5Ns9Ukm7eMaqF13+JOvl4uyyZaqf52NP9GKmC5RL3O33kT9h2ID4Y1Bf
         Kpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        fh=5f++RJ3PTzp9irAlX3Y4Lx1UwZnW/wA7fF1eHd8+05Q=;
        b=PSqImiHmgZwko+GJld0GozAWnDwstl7KHVj3mNRrJcr/2ZouNRFiMsbFTPIZaOu/JP
         lu2zEGv8qxBg2TJZNoieqxuiMXiY9FpRqll+5PmE+qxqP1hCed3t2p1wypVFLq4u5+I6
         EgYHM9jHM2otZTRNXfk0EQArR7Ni2nGVUGfRUybp5MgWUnn/KQRjkoZob4NeTxnm6C8s
         FPRin32PmZ1gVzQlOJPZ2jBL3ZK1aqVymXweYJiuUUjMmDcaIReN0bFcCQVktkOcqEez
         KgsGCXHhD+QCzMfTIv4Z/4t5q1DP2pATp0Y8iUHm/RzBMpymd5Y8idNn126uP3/1dXKY
         ENMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776264866; x=1776869666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        b=DyeJG2YCYlm5Jfo28jyiMGJIb8OH19ofc05s5mTCKKGwgjJSTH2O9Yz8v2WAaEJuUH
         fTZ5guI4UujdmROwdgGNPrblinUsBKNtLdLK+++RHtqa6VM9bfKiUVCYl/swqUadBnPW
         VelcZWzIko36UPzF+ZyqHe+TpO5U8w43JXDO+IsQmc8r+xdARDmVa2678pQZbeVZYt4+
         HlpW2y8fFK2+c/PAsXGqWAP2gFwdcz2khxG6W5LttBRttlW2GsX15IyiMFjPEFpQ/5FC
         UldcmEtqcHxdn5vLqLBHQtfsGIUKvjvmz+M/3tOhrR/KUIsCc8vxwV+qRuHSef317Ig2
         g0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776264866; x=1776869666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        b=Vnnqxz64dSPePSTFbFnwEkQzLuYVhADATADvNLLw91l5tYtkncBgBl5O2GiFjxpMWg
         SCPKOAJKUtjRrVm0HFEgQ9zhtvsCpX/4OWwW6LQWX3CboOqW/DDmliqyjQdc86o7FDBz
         +ZbOFVHDhEzXIlE78WoXEFSl4WQdwMPydA6Z/nCtiqksyYmBWrQYzv83HMc06qQObsHY
         L/Pbfqgg/oMiIaOI28BIfMiCUqfY8HWwW6LEuJU2y5eb4IwbzH+bWWxt8ZMPO2uJ0uvN
         4ZUo0OOW9iv66F1+KzbTVhb92japFXHRA+C5ci3vYbTQR5VLRTUm+CobKzCRS6BYXEJ+
         pLCg==
X-Forwarded-Encrypted: i=1; AFNElJ+QmlgnrM5QlLxD4hxwY2i11sgeKWx4wMM1EbK8VxOHJzaAZV6ANIjnoRIZvfBv/QexOSqFfR5YCjfu@vger.kernel.org
X-Gm-Message-State: AOJu0YzMT3Q+ZQ5Jf8fJdiqnOPg7ButjngCZ9FzRRsPFBGz7QG2BHxxb
	Odhro/aKtFZnfgvkOlvhbU9+MHsV1/Blx29Lbk2y3T5KCMSBVRfISzVX19k/hvjJg7/JMni/cqx
	2s3sJoKIe7KpmxXRXIIQNVYO4CO6YYTI=
X-Gm-Gg: AeBDietl8/TMfPnxvPgM6qZ5a2XXvtZAZbZSonM4FP93VoWQC2x6JkP3spi5/QPGDX6
	IpquoXqsT5sRDj2C+fHc8dzqmssgkCwe5FbDgcU3NsuWt8TCtUtaET5xJCW4r7Grph3Ry4AZ795
	GCdh06VA0vyBKwNo4BKkTBLQkRdpD5ZPUKfDdVEiHtR49Pogti/CLS5EMuoscGhKhhkk+WNjbjZ
	8J+KqcirODgwPJ6OdakHgAWPenrqtvXtkEMvngC0jD0q3eSpHA5FeGBjfDJoDelZE1+5RL5Zf+f
	BrJ5rt7/+/mg05sXn3Cn
X-Received: by 2002:a05:690e:1407:b0:651:ca68:be25 with SMTP id
 956f58d0204a3-651ca68c0b3mr11838654d50.66.1776264865801; Wed, 15 Apr 2026
 07:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415122939.77847-1-m32285159@gmail.com> <ad-FcZeXsFlSPXQj@stanley.mountain>
 <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com> <ad-XuNMor_ORjyOt@stanley.mountain>
In-Reply-To: <ad-XuNMor_ORjyOt@stanley.mountain>
From: Max <m32285159@gmail.com>
Date: Wed, 15 Apr 2026 09:54:14 -0500
X-Gm-Features: AQROBzCQeILbpKdwQzAuRTa5locP_gLXQMJMn9T_kCeBS40cbnqZGMIS571WEFY
Message-ID: <CAKqfh0HadgG84FXd2--CwOQR00V7CHpEWhL2OfkZJSyo3PepTg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us, 
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14159-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 20CCD4058DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 8:50=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> I haven't looked at the conflict.  No idea.  Sorry.
>
> regards,
> dan carpenter
>

No worries, if you or anybody else can suggest a better name then I'd be ha=
ppy
to send over a v3.

Best regards,
Maxwell

