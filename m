Return-Path: <linux-mips+bounces-14292-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKQhBs0p6mnfvgIAu9opvQ
	(envelope-from <linux-mips+bounces-14292-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 16:16:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1B4538CC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 16:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFE90305B5AF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87800313272;
	Thu, 23 Apr 2026 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffuBYvgh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Up/C/jwc"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870B031353C
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953549; cv=none; b=hXGd4sNjoVHJv5cxQgi1uduFnv0bROPq43XOSEoVofCQROLIVeEfzWx6HYDYzGCE8p8CfFWOQIRNepH7prvRnaO6IZPH0X5/VcTQ4AYWA2Xco5fFifxtMAo1bMdEnhivMsVsvmMVVWjlDmRXIRgop4FAJX0b1iI0MdMrXcQTQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953549; c=relaxed/simple;
	bh=DN+ouaVoyOfzP1qbJqimNJE+Or/ATyJ/QGg+moKK+G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMKR5Mb4eDNNl3lxV0E0eLNGue+NGFhYp0j0JNlP9L8oN4WwJjCGVuvttNM+OxCGDjlFcRjD8Oyi9ZIa30daCM59Vd5zu8Dw2U1i870DixgDLcPYb2tPnHN1bGZwgyyYp4W+heMcvBkdi8EQmKakDoucHs5OxtDOQd03xvzHL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffuBYvgh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Up/C/jwc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776953546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
	b=ffuBYvgh8jrdhY7/5HTyE8V103G0zpqgO32IcyeQ3zYA1DevQsAOrr2VfKcMQsuxRcEhGr
	QfFdrofAqgnDkJQj4S1kh7Z95McOZhn6gNwU6HREbtjbiPP65ae6CUyhvz0tWh8Qr+Ib1r
	+599CEOPeo2sWGja1sen6QW/iWxefbA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-s3Otnu67MTqBNsueez8b-w-1; Thu, 23 Apr 2026 10:12:25 -0400
X-MC-Unique: s3Otnu67MTqBNsueez8b-w-1
X-Mimecast-MFC-AGG-ID: s3Otnu67MTqBNsueez8b-w_1776953541
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa366fb79so5881285b3a.2
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776953541; x=1777558341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
        b=Up/C/jwcYZggi4jwtp4B930CRb/qhg5b65CsJvskQt2JmkXPinbukomp7Z8RAcv5Bc
         1svpZroNAtYeo5L5NdV5OFikSDLcol4YWL0jY/KW48mF37PNOYlsCJDAloDCuavFqz7P
         9YGAz916HzrZNEMCMN8wBGHINboBtwlrmu3aA3lJC0DvBW84HjwOtA4X77jszr+V6yAq
         qtt3FZRTeK/lH8iqfojJkJOVwm0A/YLfa7skTqMw7LF/Tqq+OHiS+zqOY3vtkbQNfLgR
         +JFd9L0zQzoLVFQpBdPqLnvX8v+0/uzu9ycWDYsRfha8jgiZlL6DWAfowxA7rE86lV/5
         4xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953541; x=1777558341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
        b=gC/e6zI/ct9Ylc9dSfVjCvxbh87A8Y2PXFLeQBRQmhLqHDls9bj4ORMulqLplNXvM8
         BulKnEpiONVs5Q0uMEJ0j6XnZzrMPyuwndBdhiX2ZR0iiXkqp2yQJbLdoZaXv8VyYr2e
         ev0T/MVUwT2W7mqXIZFC2I6ZBDPull8HWfjIhFcbU/WPTEMxSrdsnGJ3McL0JdtOWAU2
         +8fzfhRPAZqnH+IkI5DJx/d2ZMQxHFTDbczw8Vtyoh/iK3KxyZjD5CY4u/yQAW17/glX
         PtKZuhXFUSiIe8uwhnuh1X1U8BRDjPl/eyXHvtSmgrl5C5GB2aPVli/o3emcrZzK8gID
         hUWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SjtFPU+ult+KBemBru8WLlCQRwfvLNgbLA6kUAPtKq1txtx8D1MEhHa/dBJrSNqV96SpFsMDytJwj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2PW6QIK6t2vqLJxP4bcwR6rKzl2zdaMGyYnjR/GfCWKL0pd7
	v1fT9NRBNct+oetgouz0UMRo0jLBfvkzfqPLsNOgpkpePq6Y+8C0LpWjXmPQNBHCv0dEkoL2CnF
	CjsP9208WGzVbi9bHKxfbGn2La6tfSDodnV+FyGcuOYWJwrc4umAaVD5dYnu/yh0=
X-Gm-Gg: AeBDietNk8ImrTYy2kZPa1u/o5A9Srasn57CDhYmw5PTbanRV6fvpA522X+FqgzH9V6
	/l27gf7akQHQOP+evlluEQkiFU2LRIBQp54X9dMCy7nfUMBDNiq+p9Lk87I34LbRw96l84m5x5S
	fn+YGZwITvap/iPEJ0uOg7BXkIjbYMOLR0rn4f+sd0sPjgsKbBeb/8hVkD4qQ53o+zZMoprNtkx
	dVV8eZ1GFWn4Hgx5H3mzlC/kCNgqQYmt7YPtq6eR665wLNzru36/bPGBKW0mEUjs9gOKQZz2OG4
	/OapW3kb0oXAMjuIeXig0mdxYYEl1qIKqn6nLQ9p0S5Nkx5v7oQ+5ftzSt79C1idt1i72+RA5xZ
	GWQmitItjofqO0lgBc0iE6jNhRTh3wJ8erXeUn5GhaaaArHISFm3a+wE0b9ODt6YLgX0=
X-Received: by 2002:a05:6a00:3695:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82f8c3dac2dmr26504350b3a.0.1776953541041;
        Thu, 23 Apr 2026 07:12:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3695:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82f8c3dac2dmr26504302b3a.0.1776953540507;
        Thu, 23 Apr 2026 07:12:20 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm20295399b3a.44.2026.04.23.07.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:12:19 -0700 (PDT)
Message-ID: <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Date: Thu, 23 Apr 2026 16:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	TAGGED_FROM(0.00)[bounces-14292-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9EA1B4538CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 4:18 AM, Jakub Kicinski wrote:
> @@ -2316,9 +2316,6 @@ struct net_device {
>  #if IS_ENABLED(CONFIG_ATALK)
>  	void 			*atalk_ptr;
>  #endif
> -#if IS_ENABLED(CONFIG_AX25)
> -	struct ax25_dev	__rcu	*ax25_ptr;
> -#endif

AI reviews notes that this leaves behind a stray doxygen comment. I
think we are better off with a follow-up that with a v2.

/P


