Return-Path: <linux-mips+bounces-13581-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAZYE2e4smmYOwAAu9opvQ
	(envelope-from <linux-mips+bounces-13581-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 13:58:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CC27219B
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 13:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92CAE30F878C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 12:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18CA3C5530;
	Thu, 12 Mar 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fHqxjqGD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B258A3C3C06
	for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320256; cv=none; b=uo97Zmz++qJCtB5RIcjpiypO///CQuYV+2Bi8b+PlOrfxtWUzzlKMKiXDHZNTEzwrMWO6qoMvDP4pPj5SueS2J6uTc9xyC5rElVOD5p0BBW/oOfsl6lJFbdVUaReQKJ/lv/yMcHdQc+feVqLeyEoYbsPkrz9NJa4at8tW3rJLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320256; c=relaxed/simple;
	bh=Rr1jkAP22lZkLvo3o90a9fRSWh9+kilNKtAarSScWFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8iLYNc38LRyuAioF1Zr3IXCcJ827DKOuO8rCt7LTMoR59Fn39gEdKSn66EzdfmFanmsB2rNHNw4eLs4YP0n/9P5200GplH5Rm84LkjEIRH+BCoiIoxkblQUOEXBcjx8XyGeBmhYVR6Ov2uWnIooo3WT9+eL3JkBzLcWexzoivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fHqxjqGD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506251815a3so8617471cf.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773320252; x=1773925052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
        b=fHqxjqGD7mReR8MT2yBowt9MuNKPAKQc++mWcb4ZOttX6YldICO+OnnxWIQjO0C8L5
         wjOw0Gg7MqV4U+G9pES+s6h1NtZIjaKrBXMW81hrLyc8SxWYHtvQK3FlTjqiyroZskXE
         jYj0kUENL7Yhu5zg+0UQ91XYlYYlozX9U8uAqBEFaih0fSnDo8kprjTDRYJ58gzKRExo
         MSUW+Q+e0P2WpZGotx0DuVRaUqq4vGsUUSX1YbPnOxmRUKlXFY/aNRmXMXDbAEfx0Lnn
         e41FpuPSZjTSuTkWfTMW8e1MvewVXC2p6zLd4GrSZjvSKS4Q06nDQYaSimUW3qR5RhoY
         JV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320252; x=1773925052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
        b=wGHTZt7j/tdFSpUcgwx/kI7/LMPkO8HJiaISg1KnMOLoOJ4pRBjxQq/OsBGzOaDNgJ
         OplzCJ5+BKQBmWLlrViFQDaofGkNJikDQVwW1E2PdF8G/wPt2LYINKvgs9hUe0WBTvgK
         r+b+X3lCg6Ln8BQj1XDYrzT856csRXzstPc0zIVhta+FlWwdwD74ViG9T5TGSh67p5OD
         1/hmm6+bFjoKWuIS4tAOC0eZmtG2d44eWpp6Un5xj3GQlLqC+/BLmvYSIQdzHg1rxruA
         AcWJYg2S/iDVliX0adN9xb+3tjg3tBOX1RI5m8MfpuHmsyHlhqvlz2kRRWBDZDd5r/Gh
         fBZA==
X-Forwarded-Encrypted: i=1; AJvYcCXPDSFO47a96mfpBc+WSitdzAOVIc/lWWQDkrhnhtatBzCotiid/AiLG//Md8+tDXkm1KHF8GVkszRR@vger.kernel.org
X-Gm-Message-State: AOJu0Yymb/y5WxmRvM0915Erbu1cx47vkUeyZUPdVA4RpqYHsKyBYHM8
	nMObEDk6CswLcUhcg6i/Kc+qs0X+wXccWS3XZyp1XQlKzkR0T4B5n34vE2i92Thw4T8=
X-Gm-Gg: ATEYQzzdQkWmUPN0UZIdq1tNRbwcdvDc3CQoukzRd/FWrLPOtja3j2XefOqsjDVGCwW
	REPadtXnRa69t0ODE5EuF9rIRtkE++hzulI38t3xdeRCslNMOYN0Csvw9OScvfEswuIdHvfYPhF
	cau7B0EDqXJXksCot0jZdqdswdNBc+o0XUPWkIw8cikHxTQOnrkw2gvqcMw4WLA5GZbIzLIxvy1
	o/WHe4C/oEd9h2VQj7k3axp2A+nDu3pgIlzASmpx/RwO6VFXEdSyQ2cMc2imnpptovhvdZjBpix
	Jdu+5opVj2Uev+ohZHUs4Rsp8Y1Dw1GlcoYMeYakv3XhGdqwLmY1iwZJqZg6FUUBNu4foLGT6Jq
	WeQxz55vAZNvRiaS6LM4IM85WNswlsnF1Z/MqaljrjACxvvmmCalJD2Qskd/FjUYfb9HotNA9mI
	h7hvyKe1QZ5DN3AVILEfouLsKUBH3bHcsckyb+HmVX5PxoPIZ9OnAamPAYWSjh7lZoJK0E33Pox
	GgGPRsn
X-Received: by 2002:ac8:5d4d:0:b0:509:cbc:127b with SMTP id d75a77b69052e-5093a1bd58fmr77950521cf.60.1773320251710;
        Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd318fsm33341196d6.8.2026.03.12.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0fbW-00000006fKD-1POa;
	Thu, 12 Mar 2026 09:57:30 -0300
Date: Thu, 12 Mar 2026 09:57:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org,
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org,
	ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev
Subject: Re: [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over manual NULL
 check - refactor
Message-ID: <20260312125730.GI1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abBlpGKO842B3yl9@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	TAGGED_FROM(0.00)[bounces-13581-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[55];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD2CC27219B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:

> IMHO, the necessity of IS_ERR_OR_NULL() often highlights a confusing or
> flawed API design. It usually implies that the caller is unsure whether
> a failure results in an error pointer or a NULL pointer. 

+1

IS_ERR_OR_NULL() should always be looked on with suspicion. Very
little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
implies ERR and NULL are semanticly the same, so fix the things to
always use ERR.

If you want to improve things work to get rid of the NULL checks this
script identifies. Remove ERR or NULL because only one can ever
happen, or fix the source to consistently return ERR.

Jason

