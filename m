Return-Path: <linux-mips+bounces-14783-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJbtAoDgFWq1dgcAu9opvQ
	(envelope-from <linux-mips+bounces-14783-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 20:03:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF45DB24C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 20:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E059307536C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F144279E2;
	Tue, 26 May 2026 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VBP/XVmP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pv/MlFTj"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C2426D37
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818376; cv=none; b=q9S5c/zuhsuYj53kBLMJ+GiIezkbsoV9dR9y7Z55usCWeg0L4VFwqoEYJrNiR0jbjSE4zyl9wKtgUS/6ev/J/gfjj88hr4GXQt38c1xyMW3YDBL0kPAhVt7AiRXV7vS97ThF4Ots2BcAgpaDcAJpqFaxOAWHmlB5Al14hwAVNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818376; c=relaxed/simple;
	bh=S02hdHNrlyNXo+DoiglBQ0OphGNn6axHScvr0PU8oCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3fC5uJIC0iGUXy2gkKVdLTrBwdTd9xiWZ0AMxRqDGetzwVb5zuojDDIm4VVYe+f5AlA1cMotwe6P0LycNUERnOWu51eC8WmptYjqjpihzmeyMpnV+11yoHtD/ZCifuvos55FaEK+muupMaIwNG8vMxVwv7Qijb8GLrRS8rQfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VBP/XVmP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pv/MlFTj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
	b=VBP/XVmP+SaxyFbVBWkbkQSNQsiCdVXNv5glUvgNgQQwqaUXOQYj+nHTHBgbVjOHFaSeoN
	ADzYyYyFCmhSMwFmDjdkBnNj2k5VndlDB2iShW+mEQC4G7Erx8HGEI89LyXpVKJQk1vvXu
	YUb6mWQalEiBKs8i3ZFbIG1Eze3jJSw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-I4H1lOgyO9WiucmeSZBomw-1; Tue, 26 May 2026 13:59:29 -0400
X-MC-Unique: I4H1lOgyO9WiucmeSZBomw-1
X-Mimecast-MFC-AGG-ID: I4H1lOgyO9WiucmeSZBomw_1779818369
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8baa173eacbso9639656d6.0
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779818369; x=1780423169; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
        b=pv/MlFTjdDnmu0LUbzE3W3hn9NPfpVVGjo+Qx1XL0TkjsY5n1q/ndOSvxhHL1WVABC
         iHVgaZXxaU19Ow/tbou4Vk8SMGjHginFkJvvbp9vHU7470h5xH49iB8Iv9sU2PcwfoH4
         JfIjOYhMOx/jjmHqMFKt/qp+T32azeFkAfZo07OLjyQPR2BKN8Hwqo+Q8q6PrRb/9gR6
         dEyhPn07iWAmULChaMHCL19D8UlLrWwLpqHPHzPaLbvMOKU2q6kMRJW5D5bze/c9xbUN
         qzeX6s92O6Ed3+6mD7cIihn7QpnDNQfqhrIilLv0X3K+0F4shgI3/mnnUHMx92qfPLiT
         7Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818369; x=1780423169;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
        b=iBcBxEOxW14Hfsu38nG9xHckLqJmPzWVZtlzKKndn6N8TsdvfK5PIhAGHSFXWw1TVz
         c362wRGytZl6uXloJC6Rj+kOvBNMkML4urKTXdDS3HEmsCVcl9KicG57FL8AGkwarHcI
         ThVCbkXziV0/3GSQiu0AgkJ9jSVRVRzmGzKSLS/sxoAIFwqV/2uv42TI6TXVRV33Fl8Z
         3ki1iu9VpLDHzi0lCclkMyxASwybtRbvh0kht+DzFu1e1diGP5D4ixWSdw7Q51Xeqzs6
         gSmClKSQK0xF4sjTO6D/3VEDc2LHpTAxj/B1lavQ6fPaZfoYx2HSMPAcCunLTU64o2LV
         0pIg==
X-Forwarded-Encrypted: i=1; AFNElJ+1CWDqaO0WAMSmqL9MbcFZrapQQxI0C/pStu6su36htAKTJmSwtBdgHNMz7Uxur64+AwU520QXDsJo@vger.kernel.org
X-Gm-Message-State: AOJu0YwBeLZOHuUe3JT+vKGlUT+zyYVdON9Co7nNJOEN7PrFoWamLs7r
	CsBL83jcKl6ZbgfKIupjfyZkQ6zPaLm+belX3Rzpjjvz4xj5lcXw2jEXPe+avKPpOmtaSyIoPso
	mmjPrXloWZPkmFhdZSMXFFxi1zl88Dm4K3UxZqQaqBCglx6sXE7VdMP+ruXcgxCY=
X-Gm-Gg: Acq92OHSCxSWy0eo4zDItgHx820uWSB4iqyVaKKvjz00/1/Ug+IR37cWMV+6XablteY
	mxqMMegb+3A+wLRxrApzuiSftpGEyZfR9zmk0lmLj1R26OjlIqouwuCD7Tz8J3RrVFtbjn63fAg
	1BRclYwjprb73uDhK1XOgEQWWMok61dxG7x7KxgmR3Jt/MeDoY/W11OAJp3ghBfW0YNxZZaCTE1
	5Kv5iRG6L4LENNpsFAgIjYHU1r3PTbC6XLDcQk4TC6K7mK5InESAAWvo8fyfUzkcTt3l8gf8iAB
	WvUIRS3SQIaDLJ9+4L1MtVELhI0lEMHwmdT/suC6fwJvqauuFxfrSxYmaLYF5J7yEkLy86GjJR+
	6oUSVxdODGHEbG9e/6yvMKU4LLYQAukHFD7zVotx7pITvqzYdNwHQigSe
X-Received: by 2002:a05:6214:450b:b0:8ac:7627:8a71 with SMTP id 6a1803df08f44-8cc7b645335mr322548566d6.49.1779818369319;
        Tue, 26 May 2026 10:59:29 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:8ac:7627:8a71 with SMTP id 6a1803df08f44-8cc7b645335mr322547986d6.49.1779818368684;
        Tue, 26 May 2026 10:59:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80decd3csm147576726d6.12.2026.05.26.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:59:28 -0700 (PDT)
Date: Tue, 26 May 2026 13:59:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 3/9] clk: fixed-factor: Rework initialization with
 parent clocks
Message-ID: <ahXfftxBTE_5LzEU@redhat.com>
References: <20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com>
 <20260522-clk-eyeq7-v7-3-14ad6c2c5213@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522-clk-eyeq7-v7-3-14ad6c2c5213@bootlin.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14783-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Queue-Id: 5CFF45DB24C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:31:12PM +0200, Benoît Monin wrote:
> Use the same sequence as clk-divider, clk-gate and other to set the
> parent_names, parent_hws and parent_data in the init struct when
> registering a fixed-factor clock. The number of parent clocks is now
> only set to one if a parent clock is provided.
> 
> Previously the number of parent clocks was always one, forcing callers
> of __clk_hw_register_fixed_factor() to provide a dummy parent_data
> struct with an invalid clock index in case they were not provided with
> a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
> not necessary anymore.
> 
> This change only has a small impact on mis-configured fixed-factor. Now a
> call to clk_hw_register_fixed_factor() with a NULL parent will register
> a fixed-factor with zero parent while previously it was registered with
> one invalid parent. In both cases the rate of the fixed-factor is 0Hz
> but it is no longer shown as orphaned.
> 
> This has no impact on properly configured fixed-factors clocks which
> have a valid parent set.
> 
> In clk_factor_determine_rate(), make sure the parent clock is valid
> before accessing it because the mis-configured fixed-factor now have a
> NULL parent.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


