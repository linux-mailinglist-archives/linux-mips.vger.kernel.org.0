Return-Path: <linux-mips+bounces-13596-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4bHW4Os2koSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13596-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:05:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38595277741
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B5BA305040C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BEB38C2D8;
	Thu, 12 Mar 2026 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJaDL5Pl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7U648rh"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCFA37DEA7
	for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342308; cv=none; b=rLUVcU4P9zQsleUKiJGIZOZVk2SwctgJ0CGid8aTdC8ZORg8Da68KOgWto3yxl4jneTKe+1Lhr/BQRiJo40w98WZcNfkenekqFiHN1IpkV1H6a4V1/oWwVXQx/iJO2mtTxCKGe9ehnZYYPzvKvlkL/3AFwCkf3B6xi19FcaVK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342308; c=relaxed/simple;
	bh=gRz5kv+ZQGoeaBp3JZPi0keg8FC++izwtJHUj7bGlzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XG320kNNyzVErWiL2RNw6VyrN/mdDdqh5+uamf6kRl4XGdgFrEa01VR0kw3lj+XrvgkHBabGYq+LDfTCUrxI9DNEijz8h0rVCCTCqRtV+vkWLQ2W8c/2/Iv5bQuD3E04KK9E3qDJMeL9lM92oeImZfzYHqNsyyVrK7FuQA0Zk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJaDL5Pl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7U648rh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773342304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
	b=aJaDL5PlNSRmaNo884kVkYtAgleVQIUYnSbyIWOfKbKy2GAXiFOGFskAPLchZG+WxHUJD4
	xGWXn7tNiToi0RAzakzceLtvXUay7ZImXoGArz61TlbjoSvbsAUeDjJGJXmuhhhHOyt5sl
	6T6eRt7qa7CooIJWXd+Z4aYRWXyDrAY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-dYuPS5YhPg62V0F9D5-hhQ-1; Thu, 12 Mar 2026 15:05:03 -0400
X-MC-Unique: dYuPS5YhPg62V0F9D5-hhQ-1
X-Mimecast-MFC-AGG-ID: dYuPS5YhPg62V0F9D5-hhQ_1773342303
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cdae902bccso478351085a.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2026 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773342303; x=1773947103; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
        b=b7U648rh3RlhlQp+2AlnKUt+gm5LxwFO3wWKD7jb1DtCe1hzRX8dlaX9sPfqi4VeDv
         a0/PUdNOTZ4bhbnJwSQa21ObeTxnpuZrKycDYi10Awo2dMJH17mbiqEfNoo+kjZtv91T
         Ff7iTJ4h/ECofZnKOv+BNebcSp8jQOlsqt9yOI6VZRqeHuH7hoLG8DGdOlB1bEup7F8n
         lf/QsexdmRsnTHPW4MtnenBzZFyGmUIO6CFqNgDSqQzWnEv/npEj6xMBSIjJ/Mspvn0x
         0Y7J9c7P8o5LRVg00vP6M7qRGCJ+J9WGqyWJZVBU4CnHsvErKc+1oT6wgas+lpWE7koz
         cySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342303; x=1773947103;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
        b=r0x8lg65iqMXBjlHt/4MEQaFqYXNUbs2IF0MjUoQKKEekY/+JFtHCqTbz5xwFUO6s/
         RNylALivgdpBmo4P+Bg0qmeM9KBEpmziT8uJgrG+cgu7o4sfsebWuT0dbhwlhqmYozjK
         wTvtgODfiQCSpxePiyhkSl6i+XjhUNCCrG11Cj7FSJQ3iSUzX0YibicQMo8hBzC11Xk5
         rer84Y8Omx5VBI+KwNziUaYuJ1eWEhcjV0RWb+Br8XKE9NkHcBQ5upCmZwBnJkhX/Rps
         w0ws0vUqQ7MlXBSQT6zLzhD6hJzne19f0uT5TOJLV8xljnbgmdBCl0HfDzEX1UX3EWF/
         wc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4EiCPRH/s1GW4xs3mdtvRKM/xjFzbdTu9lCUJQ6FJmqnatMtck45kuk6rC+klDNkEKJ36/rJIebDX@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKm11UxN1CV8SZzs5QAr23CDap2YXwn2ow4rjBvnYG4OM6ddx
	uQ3S/l88QOPJu1PseHz4IjzNOTGfjWRRI6wKzE1uJPPWLBBOVFxMv1yWd0IkDI+vYEVUNEOu4F1
	P8PnBmmOvk5eDCd1rlCw+3gJTZWkAC2tVGyXFIr+8T/ok1XkhvtU8scfmUwUHWmM=
X-Gm-Gg: ATEYQzw+OCMrAmqPZhC9xeJAYkRj7DEIHb5+b+ElEO0ZzazFyXOOfouW2/F4B4eWb8M
	36/Evaf8NtwpciniYEYcQKMSkxVgRPX3R++bTXkIgeNvEhLtr/5u/v/rtxsz92ggczJLzvNCn5D
	RvJjNrBBgfeDXX4TgdJ7ySmvxT7hiv0pfvbN5fpjSkyBaodcGmST+VpWTQwy4x0+jQ3etINTDKA
	VUhhOlfFcvpGiYTYaS43NCHFs9/Zl4BNiRZscACeyazG7nBL7G1mMQzeJ23mhPwGC4gqbP8xoUG
	Dzgw+Rku+n7otw+RQCPzYXBSBSg2oaDWHsp0khsk3xvoD+hbuMDlBFndAtiIR8XFPdLsY98n9f9
	zj/9GXEsDflQgHCHolsBcy7KclAVmA9+Zg+AKubbLjuYMR4Hu1lhkEzXQ
X-Received: by 2002:a05:620a:468c:b0:8cd:8fc7:8308 with SMTP id af79cd13be357-8cdb5baaa87mr107675585a.75.1773342303005;
        Thu, 12 Mar 2026 12:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cd:8fc7:8308 with SMTP id af79cd13be357-8cdb5baaa87mr107669385a.75.1773342302313;
        Thu, 12 Mar 2026 12:05:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd54f9sm41198836d6.6.2026.03.12.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:05:01 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:04:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: airoha: Add econet EN751221 clock/reset support
 to en7523-scu
Message-ID: <abMOW9N-qWqqbmYD@redhat.com>
References: <20260312162449.569359-1-cjd@cjdns.fr>
 <20260312162449.569359-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312162449.569359-3-cjd@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,pengutronix.de,nbd.name];
	TAGGED_FROM(0.00)[bounces-13596-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email]
X-Rspamd-Queue-Id: 38595277741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:24:49PM +0000, Caleb James DeLisle wrote:
> EcoNet EN751221 clock/reset driver is significantly similar to the
> EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> divider registers so there are fewer known clocks, and the frequency of
> each clock is derived differently. This clock driver will probably work
> correctly on EN751627, EN7528, and EN7580.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Reviewed-by: Brian Masney <bmasney@redhat.com>


