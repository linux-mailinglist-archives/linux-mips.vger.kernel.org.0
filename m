Return-Path: <linux-mips+bounces-13744-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDScLk1DumljTgIAu9opvQ
	(envelope-from <linux-mips+bounces-13744-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 07:16:45 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05E2B640A
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 07:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AA9F303DF78
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 06:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4227A2DEA68;
	Wed, 18 Mar 2026 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czA+VIq9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73273033C0
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773814601; cv=pass; b=VxROWYihtrOJk+2vOuwjEPd8wKYmgpxDo0iW+iyu/dXIs+QSNPQoe2tWGArXkYxozIQZBAwt8sCEuE4LqBGRf8utNJxqYgFcwyezyMwXfQfmz1ADdSsFA/VZ/TUiNzfK37tXngr5+II85Sfba9vztjyfEgrqSaVzOnXQeBO2mQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773814601; c=relaxed/simple;
	bh=LyvuvQqufknbMfPTy2o7n/T+OqohBBDpzWX+jX0Ni6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYQlt6B3tQVCTEjGziBmH/WelTxG+Mj0Qv8LvyHY4DlYahr1r3ewkKY90ZNpKBbInuzNBn5AQlXXvM5SygxS95BqgW7UGVcItheTphgprs44P8ViblKujQyPUVwNz+LVkIwHdA6zavj0YP9DXseDz4Zc4ImDK2pYoBa3bP6+Mk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czA+VIq9; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-667df358d78so283500a12.2
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2026 23:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773814598; cv=none;
        d=google.com; s=arc-20240605;
        b=e5UQjFiZY1zJt5J992DHi9s36I2uShFlsanJWeI6Jc5o3SHSvSah6HELgX60Z+MytP
         2b3PFsTxK4R5FQvQhdOFXMpXHAFMCkcoSQltAfIOt1x3L+noDccDEDhWqrXDxUvnu+CP
         F1kOs3rDO5QSL1r7dxmHwQijwfPqduTpftuVKPtjZsRzCs7jg2qZzZ2dgEGlPgFAE/t4
         I5edCwOFGhn0V2G39DHz9dmJLF7TBg/SpYz235P4ust7rZMG/AWaYBHPeoEA32Swkabb
         hMJy4k3tTYjBNd0KEvflPbfwU8CPKVQ7k8k459B5mRygJHXUJwDC8yMVNgW1unN1XHJb
         iJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        fh=mrNcVS5RmTGlMFvH1k9hSEbVg6rHHKbKniq5KzRLq94=;
        b=VRfomeoHtc5T99VsFK28oDLIgUBOgLuuuv7MS5s/IjFPZSYnlU5WDxIJWB2cbSjZia
         FTe652LERGeOzsUr/MATGtf/91w3hAjR+xbIs3iprw5BNFNMDmbZa7D18hzjysN4zfcn
         qSBzCx4e6g9z2jJ+Q6sX7AjnUdgIDJsw8xBrqdf8JcI7imZ5HRv/YmAt7JAXjyNnaolH
         9YFbdVLWjfDsKEaiC0YIAhht4WEXBlDnQEgLDLh9lRuzsMbagrsW89SLAwzll5+Pocph
         TD2p9ijuRJuCJhPwkXw1pLHlHgcLGrKp9RXjIP1RZwfcBMF2VZXQQ2jvR6aTnEQckgYN
         9neA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773814598; x=1774419398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=czA+VIq9QGWQxIWviOuOrte+AkszdW/h15AxwnnBl8PgQdCUSJeFt/rkA58JF8bw1z
         MYdnPYGFr5y46Y9Ze6hH0uQbYgBxWhk4ISCFrpb1oCRqUKW8TesUGp2nfyk/tjdH6ZzI
         DwOCFfQmjthVedmcIE7z/9904oV0s5pfRk6WMlT+ADyKZllzFK45VHyMvAMFKoo37U/j
         J1nqKAueMk09QeZKqRnb2BbN9+d1iclFRFK4eWers79RzlXUT6c5NL6yIGsvvdDwBLkL
         mIaXTaJyIolZxl+55rCZtIapNWvPnqXYQeH5Kjuv+rgtZgAO2r5C3jf4lHbFErXbdAiD
         Zyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773814598; x=1774419398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=Y7FLHHyvJDpIxK9U+YrsGqTp21EMHgBdpmKCfZ8nlXglij7u4U3WdhgAs21aUAMsPL
         U4GSEi4tnqCzdjH7wCUxCvOhqNPZIpajg+jWl0ZWcCdxkIamJDkNi9RK3wBIKK+Nztc4
         jxFUIgvYuyjmWuXu2p9PsM0HP/K/iDttb47ZwZMlwXA8oaz0K12OBzNPCUh8sxYIUfeH
         nNNqNUS8m2IGqd+zm7mlY73rVqQia+k97JIJVzPUCm1SSa/kbp+FKBx2mSFBGrAnmD/Q
         HoDTrWhof+5hWSvuf6QB9Rz7LGrqhHCKVLdSLZlwK0mbwGs30l2PcVz+gWUm7i+Atf3N
         bB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7Kt9PNjGNaY9b8Z8Y28VDxM+bhEWmWIXxBwEBR7YydD8SYpMI9FC3QZC4ouHMpGH1J9RR0TE8J9KP@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVYMxal2UUR/0HmG2A9Lz0JLwe1JWLxrvsdCQxbqEglsFTzPR
	FF+m8oFCH08aA8bbJwpmMGFU71FEFVfNULOXiKot4TIv5PNSvxC00+o4h1Ejzw0dUeqzeH+xp3r
	UjKP9H7RATEE1PrXIGsJkHNjc+y3jIC4=
X-Gm-Gg: ATEYQzxs7pFPo2C27p+cjmuZOKyoIUpSt7FnDVpznCrb3KQwL1cQfJxzXHthHy/E/Il
	7VOzDS9zO1Gn+BwX7bq22ifiB0Ks6Ataz+ybD6I7nLy02vemp1NeZvd9lsfvOPqpZ1DIJ2y35R8
	MspTK8QvKq4g9t3dqQgWM/w3vkVISoh30//ZKWELX6M3BiNDs7o9yTt9N6Igr87SVZ0fwRko0IZ
	ClBdAFhOHulq3Kbyp3LEolujlvlf2G6d3we90wmoxg9UAKFvm5EgkBoGNA+Q0fwCsubQS+C63Aq
	lODQNIDCJkevdYqDFJax2XUBiPRAuuDRTmRK7IfPPLnn4ESvN7A=
X-Received: by 2002:a17:907:7b93:b0:b97:cc05:61b9 with SMTP id
 a640c23a62f3a-b97f4801ab5mr133040366b.15.1773814597747; Tue, 17 Mar 2026
 23:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 18 Mar 2026 07:16:26 +0100
X-Gm-Features: AaiRm51Xx89jeaivgNYAhMk2LxpIu3kD6j5N4SuQDZ84WCnP1EAzJIW2dMNKGiE
Message-ID: <CA+=Fv5RLtUPp9BhXfFEUk3roE3Gah0iUamDEZ-MXCNM_xKm3PA@mail.gmail.com>
Subject: Re: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13744-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7D05E2B640A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 2, 2026 at 1:32=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/alpha/include/asm/auxvec.h      | 7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>

Build-tested on alpha, no issues here.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

