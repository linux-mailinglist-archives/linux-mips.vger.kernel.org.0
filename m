Return-Path: <linux-mips+bounces-12982-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCMVOxJZcWkNEwAAu9opvQ
	(envelope-from <linux-mips+bounces-12982-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 23:54:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65F5F1C9
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 23:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 417E6902368
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 22:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBD441B342;
	Wed, 21 Jan 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHOtLHV1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtDoFVbf"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1A3D3CE8
	for <linux-mips@vger.kernel.org>; Wed, 21 Jan 2026 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036040; cv=none; b=kfqb7TuAh9JdJPLgefhzYHhuTs4pzl8j5/cI+3+yUTyFGKWXGmxyavK4uq012R2vhD+Ol2DiebkABdJ1eBdNcbGcDynoNqB6Gni+sxWDWhFaGKqJx5u3u8uz7hstKxFzKLteBVv0d+yUTs956vXSoUJhMA75/PVC9O+0q180VD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036040; c=relaxed/simple;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXd4W4WmXTAVy3l/POMq/vIr8go6I5IZY6CIbodhIB/u8JdPxYvuDjfNQoV3f0S2PZQkt2/uct8Nu1HWwtEnPoUB+lhh9DdUppVDmrmlC8v9JxtPgVNQF7E0CMUYqwEjXzd2yF0VWuhT6dWxhX66UXi3r35gHmry1po7Cf48hrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHOtLHV1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtDoFVbf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=iHOtLHV1w7oSuPv+8F+UuBYkNIL+S59QcmkP0xKN1x8tnPUz2hkM9BDiW8ESUku4bt3n3V
	7SjcjFWhdZdVwIE75Xlyu/3mmaYW2VXPTgmxbr2Szk2X59tO/1nrg90gCqlT+QtMgxZEZF
	SqqmiRbwXzm/wY8vfNOt0LIgaJMzPk4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ZhsFwBJ8NTmVsiKaLDhrZg-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: ZhsFwBJ8NTmVsiKaLDhrZg-1
X-Mimecast-MFC-AGG-ID: ZhsFwBJ8NTmVsiKaLDhrZg_1769036031
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5019f8a18cdso11078641cf.2
        for <linux-mips@vger.kernel.org>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769036031; x=1769640831; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=GtDoFVbfPIev6Y45lnUj8xiA8GxcY4vLl7Zc+zcX/Z69kLArm87l/wSqn/UI7DCfSf
         U30AimhGVESqjkpe/jreBjvHZgsNKn7docRbMu16NEBpLoFzCGFBxuqLQUgyXu5dVQis
         HaT4reFMxuhHlp5vW+xnI6QoI8md1+lGBpH4Eb4H/yOGB69lkFRTa1lL7OKfKMCx8Ztb
         SHjmUGudpNV/kOuCkjTFdlmS47bqkS46ZDIM4ORSaYcXzVvSvs2cwZCDSH5+19PCe80n
         iObPgZrtysxGJfgmz4JJmJvBVw1Pbm/IW6vXLbEl2gCIfT251WTL2usfoDhuCbaPGo68
         ebYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=ijSAJ3pgXq3Wdpoq/dedb5zEqBB34e1JERSw01OL4999ZI0JRayvXiXoiQeI72CIT0
         CXoFP/mGcc5mAofG+Qa+TELfE+S+LkAh3dhviLKm0aGaJ3TbRraudyEZgloZ8LaN+NZh
         hLB1XEhvwwaSpumoT8spzI3ACOxh0JbptAKIAvM21o1do4Ea52ud9S/ft+vX1Hd3X4Lh
         SjMP2hfF4Hp+lQATjRQH/xpYq8UeFVhpoSrcihuSUXW3lIvof7OvogBwMHfEu+QCnmFK
         KxvNj38CXKI03ZNv8FXOf2phTqUlT7qhnS6WR7eHee2lsIZDEatLVroJxeyZtMATsVZG
         K5fg==
X-Forwarded-Encrypted: i=1; AJvYcCVMb8QB3EMvzZcHKVAC2vxvEfL1anszQ0Qlm8rBSFB/XtutEaj4Y96NxPkNfMPX9s5spP8vDdoc/KA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27jSY4gqZNDwBEhmi7Ouun+xh3Q0k6dYfLKc/eg8wkRN93QJd
	wJ/n1tdNH3G6cD0PFSrNdvn+rbwYIgM2SYhCti8273AMeYp9YzfzZP6TNFDM/1qyhVF9nXrTwb5
	M0TqUaGCXQmM5pwb0Rs/oOkB6wcgnQEiAtLNUnMErJY35VnRwKliLQ3XH3OGXEJI=
X-Gm-Gg: AZuq6aK61mjLfRuP+B0LcSuiwKMQClj4nA7dNx9SzuXwq7nyMSrawZmnTrPSh/Qg71/
	7E//wxFBtlpIGTTiFG5pltYGyi91smy7tWqD56yGK2BpiUpNYgiWFGrsexpKkWF37aI6eZnARjn
	SPuGd1VmSNkpBUCyvPmPPsmxUJ8EV1NIY9yTpZKJeCUWZDguDvcTl6qkl7FfCE34HyVBIFyQcHq
	LW9J0MvzpgZmqWLdF+k2eMwEkSaNGWurgOrnNfH+2pCNmLcAHLVZeW+K0Qq2DdxpnTvCKd0daHO
	ZtZFNGJzkzeYVIAI4PzPeXJ1qe59x6Jg/XY3hkLfcqZzpreQajcoNqc13eTUslDevYmubFTZoyd
	a5NghTdbS
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87957311cf.13.1769036030806;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,gmail.com,lists.linux.dev,kernel.org,sholland.org,lists.infradead.org,bootlin.com,suse.de,socionext.com,nuvoton.com,mleia.com,timesys.com,linux.alibaba.com,foss.st.com,st-md-mailman.stormreply.com,amd.com,oss.qualcomm.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12982-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D65F5F1C9
X-Rspamd-Action: no action

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian


