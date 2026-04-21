Return-Path: <linux-mips+bounces-14214-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBZuD41/52ku9gEAu9opvQ
	(envelope-from <linux-mips+bounces-14214-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 15:45:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B843B7A5
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 15:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA79302836B
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEED3D75BA;
	Tue, 21 Apr 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="cClBgcUC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED23D5660
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779108; cv=none; b=U3GIf4p5fU8UoEOva9K7BvyVUbtnbPRomfDtyzN/gbzbygwYv4aZ4mqipenpcIHGaFwGnXvRhhD+Nnu0t8A3GxbT1J/RBTYUo2VUDshsixgScHJrIGpQgIWh1WvXdGwHYFpeagQnrcGKcBBkXy3kJjxGnUtby1+ml3pQBA/4zUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779108; c=relaxed/simple;
	bh=bksQ0Ol5sH++UgZ7eh1JZKghAgg2lGd7XkvUWodW28Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Po73J6qKlnUs7Hqy1OHQO9Nusq4i+R9Bcy2MQfd12HmUKHwQCqgH4SzM19uQJBt9bsQB/VbCJI9F+wi+2iOLTZZk4r3CiCgtjxzRK6uUK8IvzDT2Jfag0zStuENKi+4vCbODDAiR7qCDK/AnLYqpMuakpa14uteKiCsSVHY+9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=cClBgcUC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1279eced0b9so6118447c88.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776779106; x=1777383906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2J0baGW2c8ot7ZAwlVMoVMOKmtoMvPmfiKlkz6ZsUc=;
        b=cClBgcUC24FdpKU2JnH4Pa8ghonAWun66lvlqsMc0TS6SM3qmynBXdFhPo3KpyVpL3
         DKjBYtxguUkFOqMANugRC3jAVyxb1ZX6dIcyw6hwUjpTwr1XE7gW3u5T4G0BSoU/31g9
         voXRPi2wMK0NpJqP4ugLXin628LoKtljsRGv2qYTQYKQ6RgT80/ydejV1z85/MIC+w+h
         lnDc+oJqG4bbglJfzOb+2uxxrAF0hOKL+mnm99VJMHoiInwmUg1N6YN+idWC2RW0UxMd
         SofU7/kyVRijZ8CC5mVA4YW0PPNBSr1Z3vkxdLcRafiF67aAhqK1yY1Iz+bZuYcc2sdm
         Pmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779106; x=1777383906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2J0baGW2c8ot7ZAwlVMoVMOKmtoMvPmfiKlkz6ZsUc=;
        b=Gv6AFRquWc1+zEK1Gyg3n3zGrKt/oYdNkom0lxmlD6Tzxfc5cjqNZg+Pub3XP5J8DS
         mHkuDVTk2FgA0r3/8qFBWHcl/jB8lfY+Emf9dd2Ov1ccOneRu/YAwSqgMVgM/OeJPeEp
         5a29CLuj3e+pcYNDkHJz5eDzVoYgN37rgV9IQKZohT/yBQOyJX6RGOaEND/rWIXHONJp
         pH8zBmoJ9s+oNNaLdc9vsSfvkifcfYPeb+tIchdDIBBq3iODbeKPziF/Aef7gFYvJXwn
         uNLlkkavo7j8oLcX1BJCjyzFs+/EneLnT4BL601ftdtpsstASMV/J3dGqRLlh48oXBCM
         SC9A==
X-Forwarded-Encrypted: i=1; AFNElJ+EdixVXt3GW5mjxco1y063K0mWUcysFb35WQnQ0bH6jr0t6YvtJV1jXiwE1LS8i7+7AVM2fLkW3+aG@vger.kernel.org
X-Gm-Message-State: AOJu0YyYrjLekEnWe3McliBq/zNNmeIYDVybU6uhfpYSmMs9EXLk7o8a
	ZQFzzxOEbpWR3GM7+n9mHGoUFpYy5du88Xb6VO89kXIneKBOZfFZyWklj+irAs9Zn64=
X-Gm-Gg: AeBDiesKIN/EbV2n7Kkqbdxz9H38z4SYGPww2ACrbedpRmZP4NOhuvmFiUWfXtHX5Lv
	5DBOvD7RVMC7NJ4GHZO5LEqudE88r9Bv4U9Q/o/SAZxpAYNz6TthvSqyj4eZCLe2eRVbYeIHELZ
	v/WLpeylHCJMLNxjvlsoS0xQ/Qm/2/tgmTdBc8cg6dET7GCIF87VzRXl7Pz056xIE2BAO2LRSP+
	ZNT1Zs2Q7KanvEHlLTJeCtVarqgzATchJN+b7hkSfsg5/+Be+idv4Q3GLhA3VvwZ/ZcLpsxWXNd
	Fjvn2osUBH3p5QuN0Zb7aXqqHAAEkIi9lIiIOWiydnhb/akHU7O39AoGvO1aXN9gyrh6rJH4P3o
	5Ym80v25dlR40l2DYIhS9dKbhmc3S/vyDuSk6nG88EY+/3U+mfpYvHxawEcpDCtwCDnoqyV1TOg
	AUgpT7PV/GTeXrnpAZFZmoTmHuablGn+HiN7TE42cbETPBEA==
X-Received: by 2002:a05:693c:2b15:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2e47a1027d4mr10807993eec.21.1776779106079;
        Tue, 21 Apr 2026 06:45:06 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm19250116eec.28.2026.04.21.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:05 -0700 (PDT)
Date: Tue, 21 Apr 2026 06:45:01 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 toke@toke.dk, kees@kernel.org, crossd@gmail.com, jlayton@kernel.org,
 wangliang74@huawei.com, aha310510@gmail.com, takamitz@amazon.co.jp,
 kuniyu@google.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260421064501.4d71b943@phoenix.local>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[networkplumber-org.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[networkplumber.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14214-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	RCPT_COUNT_TWELVE(0.00)[47];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[networkplumber-org.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephen@networkplumber.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[networkplumber.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D3B843B7A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 19:18:23 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
> 
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
> 
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Acked-by: Stephen Hemminger <stephen@networkplumber.org>

PS: once this is merged will remove these protos from iproute2 as well

