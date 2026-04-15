Return-Path: <linux-mips+bounces-14156-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NCqGXeG32nSUgAAu9opvQ
	(envelope-from <linux-mips+bounces-14156-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 14:37:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD140450E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 14:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0634D3074D1E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 12:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178564594A;
	Wed, 15 Apr 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3NmrQ3D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF758271450
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256376; cv=none; b=EzEyBbo3MpY/Bfi65Si+c5nbwvXUITaW1qd55vRGaSA7Huwy4Zbi69sxLlcbgIZspSaC9rf85ELHZSC5kSOrk64qHWh8CuNhbHz818fNqXm4OeYZKnNE41kiU9GutUuXENhRPtDJgs3cA6SQynXn8JzrJATYbxZXST1N3Bnp7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256376; c=relaxed/simple;
	bh=4fRC7ugcdpBzmiBi94pawPj2gQ01gH31+CXKdFmV2kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXhDL6g8EPC0GJQqroEf5jbPDzbwmr4uGlCdcRw5mKVUgeQdZsdzfpyqLFO9diIBPEP/A9UipQVg0h+pJumAQs6lpkdFWzHbQD/Du4PqnKajIKl1nkGuWNhg0Z785kacoGIwM8K9CJJ90j6DT8P0nQ4TcEtKuxO1QrLT4CCczG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3NmrQ3D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso110702745e9.0
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256373; x=1776861173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4QGKACJwE2/9AKPpC8u6xf56pqFwJttRvP08nI/Ba4=;
        b=V3NmrQ3DdiO4kJfBZhC0+dtH1UaSVTWHkLCoFDmOLK4Fnxl/xjhubg+X6wiYhwpQx2
         ih/vXmlHHBnfn58dtNR+iH+YMcDsfdYde87R+qxDJbMawW0+2YDuW77U38eO6OYbLNH1
         seKQcG/NcJinuRGAaU9Ed/SXvqv5wm22/H9iVcYAehLxytVO6oQVcXcH8Xt6zGGti4ri
         D2jSzqlsUuNifsZY0BBL4jDIcj1YRZvGbeUZfripg8Rejysg2ZV1D1WAK5sBdTQLPcCt
         CtFN5k1YHO6AfYKXkM+MIhqoYAzZzPLoPMZC0uYuVUbdJKt+Zff0ZliH+k29sEgysc8S
         o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256373; x=1776861173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QGKACJwE2/9AKPpC8u6xf56pqFwJttRvP08nI/Ba4=;
        b=X4fx3ZSyfLeWcpUW/ooNy9UniVztOiaBylBg9PP9imnB6zSdpaeWI2ip7wzG4sCe+S
         ql9x2SJP1Idxwpi+gdXWQM1pRea7s/rEJYxwukZvqIikKz2F/XxPCpWEFs0somRbybpc
         rBUd4YN1A6E99tN7AQHJkvqdWF7NiCffmiEP7uQ/T5IV4iUUkRl71dtrIh+taqjh79ox
         pqNDGEDuTt/R3nSl0XKH4Z3i5XCbjhbLo8Y0cA0j0SyIQxYsYBbRt4sTi4bU9p5/P4M/
         GInmy+Gmc8akrPv48+JhjF4RJTOEdbLa/l95CawEtOgzB+p8eWAYFyxOx3Qxf1AmUUYD
         vvlA==
X-Forwarded-Encrypted: i=1; AFNElJ/A2o9nw3jc094qehiyVhwGavTdswHD385yUfrx8WpF0PH1ixkztcE30zR0/VDJ7PfwxcACxPRTdtNt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm6vAO7OhCS2iyPieGiD+OFFUyTtIglz/IXEiNxZ4nqO/bT0Lh
	nMSOYlvk3yFsjq2UPxqoBQO9dTTg56t2jHriuwwxHfj1203ZQ0RDsZU0
X-Gm-Gg: AeBDieuGI3IoVdiqZ/HQxurqhFEBJWbdEdmi90rMl51KC+aigBcD9ylALVhbz4/OCz6
	TzopuN86/x7MV5O/rQuwWxwATnwR/S67hMWDHIWWVsDe6Dxwb5JBnx7b1H05UgDWge04p0fjXcF
	ZD3bzzO2CJWl2WvhO8ESFpv3+2xuZYex4Af0EJi8LL2kocZ3zVqtsNmuC3NFerlJRvzgnFNvBvf
	Ay3cek7SuLxATmHAPbQvkJO/eupV5UleVJ5tlHrl3/rp1xt7gkqSEBMEk+3HhzxNFdreOeCLJfw
	HmHTDed8dF6YUuO3daQuBOOGx+9aV9k2uK8BM1KOYK3Z024GgKS9aqAgMoXC/DozGFml8iBXDdp
	li43REkLSgjQnRqx2hlxTuDu2Y+g8UKmE3mm8EPnzx5OoE20Zka9QJEnsIsMWrsyiu/WaF0bFqW
	pFI+CQ20R+NXyI9/EO+3c=
X-Received: by 2002:a05:600c:c0cc:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488d686dab1mr208019635e9.24.1776256372924;
        Wed, 15 Apr 2026 05:32:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1d5dd43sm47579105e9.0.2026.04.15.05.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:52 -0700 (PDT)
Date: Wed, 15 Apr 2026 15:32:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <ad-FcZeXsFlSPXQj@stanley.mountain>
References: <20260415122939.77847-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415122939.77847-1-m32285159@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14156-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 00DD140450E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 07:29:39AM -0500, Maxwell Doose wrote:
> This patch removes custom typedef enums and replaces them with standard
> enums to address the "General code review and cleanup" task in TODO.
> 
> The following enums are affected:
> 
> - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)

Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.

regards,
dan carpenter


