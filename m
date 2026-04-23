Return-Path: <linux-mips+bounces-14293-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL39Ejoq6mnfvgIAu9opvQ
	(envelope-from <linux-mips+bounces-14293-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 16:18:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11345390C
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 16:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FADF301116E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315C431717E;
	Thu, 23 Apr 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CuqiIJlO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R6dh0Fle"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C631716C
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953911; cv=none; b=roQzcj+AbPxJWXm6Kczf2WMfaf3mmW7VTMcuu7SJtzK+EEN491syP+1Hsgt04bixizMX/O9eHdiw83Jxx/PXnKBdJVvs01kj79fStTD7X7/eUlzwGRk1QVgbv4mMj5NVPbfMt6NsW+HIde2buomN0kLfCoE7z6C/I3n/K29tGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953911; c=relaxed/simple;
	bh=ClZ4xaF+75tE/H7H8q9CGZtUI27S/faw1Lq5OD0A4j4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tF1J+Mb2J/Uu5R5RDwlwnUNJrz1VJSyFZJTSYZy2JalqM3VKkWsI2Xla66CUVtLfTnnLk/tsHh5oOaP6Xn53OQ0z41D/Co0tMrHkqD1qlfYRVeluZLToCX2JPdnRXZ8qckxndjsoKCLW2H+Oo//sPceeiaa4qQgaALAu0XsouEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CuqiIJlO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R6dh0Fle; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776953909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
	b=CuqiIJlOlXcfpOqzf6/t5XqA2aX2d9C/PeBGT0P0BXMIorLkT5q8gzS6zXExUqQBqaEJOW
	4uMJzokajVjzkrkauQ7FGKOYF/uKIQGnyb2lHULmFCd1bsJ/lZY3znPv4Juy2iAU0Ux1+C
	yLcud/LvwYhlbf1KdyiHEsrU80PYQc8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-30WH0MbNNtmpyJ78fTRckQ-1; Thu, 23 Apr 2026 10:18:26 -0400
X-MC-Unique: 30WH0MbNNtmpyJ78fTRckQ-1
X-Mimecast-MFC-AGG-ID: 30WH0MbNNtmpyJ78fTRckQ_1776953905
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so91181325ad.1
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776953905; x=1777558705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
        b=R6dh0FleYiWofxxbOq4X2pBr48sjmZd3DKgp2v0QkwEnasWSTFaQo61VJFm4/cBqQp
         ap2JHOYrBAvupC6v1vRSwSKtS2EPl2+yJuP2Virvfn48hDzfWWRrHl8UXqpS1yb+S9Cc
         8YNJpUXhMNWKheZBcSaBEw6CisQYF+zQPYjpFcp4JNbMOhtVgQ0dohvwcg1fBxLRmSZW
         pkFdwjDGtNuhnDugilmEe9OkANA72xKwAmG+O72AdPqHdKopYbUQGm01VLXutzXCVYTm
         UYRjsWcs8Ei+imf8ZiUGSrCsGmzO4/VX3WgOB4pg1GS53oEkzLVc7FyZnW/GMZmhjvda
         WByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953905; x=1777558705;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
        b=k6HvCdrxB4QDmKOIB0s7OtqNzjG2wjJEL1v6GDHqvlNu3jMddnFK6obwHrDOl7sUpl
         jLgWbARYs1iDJLU/H187o1SXXhSaZVLLUkXjqadGAcir7LXM/5hsgcOTtBlL7cNbmgKz
         hfZl9lBYudGgRcwQn1QK9MvaPI39WkPGrgv+b7ISfDu2lImqs9wySJW90c92XAv1ybH9
         LubI1OvoeJpcW/HKb5ri41IhNczbDkFHVbI23yfzXzdHai46owJMuE51bdb2XyysS5B3
         l3mRQbqqTsvZZ64RgLZESUCewFJsmsZ5UHfm2XOK2H06nPWsACpZC4UTCqSlvgP+UYdN
         ONuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nDKf5OWQuSdw7H6Mqe1HwdvyQM+9BbZ4n0gTZLeqNkl4b6TY1KK/oJ3zL+wJxssVbtfD4+Kh4rTS4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7skU+3hheFbEVZlZrZCtGwU+arCVbKPp5P/L2wWjF1lS0ShID
	z3aYAQ9gdOLt7WULxyXFhfdFJbQf6TAHiqY8EitrPXVI3iAb75xSt5U2+KbuM/BL68LRZNNBqhN
	qU09BL+Dm/Wttp+jf+hVEYkDXJnzR33dN/5M+eYaZIaMNgtTSDEuv1v52xV/+2ow=
X-Gm-Gg: AeBDietUf3iphLcKoowK4pa+oxEw3iMzEqVJKMlJJoXxZvvFD/axMk5qWgWwk7HtaUQ
	PvVDzsK2TRgb/4GUy8/67ymlmg/I+TYtGGnmihNkV2Bmv49w/UOjFTtzxsj5WPmk4QtlEpw8b41
	6CLn/8Cz+oFWXlkx1n4cSdmaxflg3IK+VHVzI23hWA+Vbh8+lcT+EO85s4Cz4A7pYDXAo5D1QSv
	pYxciMGHSHkYqWWxdvvOTQisNfKlcoeeEtXH6iKxFeQJyNYtOfax8Rp2Y7g5y+piVzWMAjPesr/
	Ol1Ps56N7o0o7nvvYVREtx3zFtq3AM71W9ARloh3OqHlDgW/Myu7uKLGJ/gQeZFsjElAGQTZCZH
	vDb+CpV6Fb/X2LPnrYpMCvSkHQisUjOYS+HcZt5hnoCUThH8FcjgnITLKz77GV7F8ivg=
X-Received: by 2002:a17:903:1a88:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b5f9e85ceemr278654875ad.7.1776953905295;
        Thu, 23 Apr 2026 07:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b5f9e85ceemr278654025ad.7.1776953904639;
        Thu, 23 Apr 2026 07:18:24 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20695sm194915885ad.56.2026.04.23.07.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:18:24 -0700 (PDT)
Message-ID: <534ef6ba-e4e8-4ddc-aef4-196e7a91e81e@redhat.com>
Date: Thu, 23 Apr 2026 16:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com,
 alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org,
 jani.nikula@intel.com, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com,
 geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org,
 mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com,
 jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com,
 enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, kees@kernel.org,
 crossd@gmail.com, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260421021824.1293976-1-kuba@kernel.org>
 <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Content-Language: en-US
In-Reply-To: <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	TAGGED_FROM(0.00)[bounces-14293-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C11345390C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 4:11 PM, Paolo Abeni wrote:
> On 4/21/26 4:18 AM, Jakub Kicinski wrote:
>> @@ -2316,9 +2316,6 @@ struct net_device {
>>  #if IS_ENABLED(CONFIG_ATALK)
>>  	void 			*atalk_ptr;
>>  #endif
>> -#if IS_ENABLED(CONFIG_AX25)
>> -	struct ax25_dev	__rcu	*ax25_ptr;
>> -#endif
> 
> AI reviews notes that this leaves behind a stray doxygen comment. I
> think we are better off with a follow-up that with a v2.

Or even better, I'll clean it up while applying it.

/P


