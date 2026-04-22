Return-Path: <linux-mips+bounces-14228-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKl3FiSn6GmZOQIAu9opvQ
	(envelope-from <linux-mips+bounces-14228-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 12:47:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7396444EF6
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 12:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 450243018282
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 10:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CF23CCFC1;
	Wed, 22 Apr 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6bKDgI9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CB3BF67A;
	Wed, 22 Apr 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854736; cv=none; b=Lwzfnh2hqBaREHemN62p+57Ap9aBU4hGXRHfy9V0ZL/HjO/nXgow+qV/hBU+YG09P6AUfgwGVME4gUblfDvTKFl0NNKA3DVbwPScb4S7eUViqwr5l2ny4FIy6qPcohqWyACFIl+ZZH+T9kkNa92m3KcwbhDTvPhTSFkfP3qayk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854736; c=relaxed/simple;
	bh=TpfNQlTkSNL7BzUK+Pd9K+KxRlrlEHZM5h0NyDeSYWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ4twTkSPfcFUS6b1fhCR8KPzYiAq+wtzBkdLYopemJ7i2U0uTwXPAPxrXVBs7v+say2+SKg3DPhRCWs2ZoTDFLIuZIr1tKoruQjQntLfrye3sClOMizyqMk2ASnchQD037CDHfKmAx2VXCaUskPmmKaZIX3GYCh6kEC59cS/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6bKDgI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7891FC19425;
	Wed, 22 Apr 2026 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776854736;
	bh=TpfNQlTkSNL7BzUK+Pd9K+KxRlrlEHZM5h0NyDeSYWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6bKDgI9RhEZIh7+hobdoxWlVq1gHUaQyXR4m+1d0/IMupVsD0m/usRRM6n2xHp7w
	 LH52RTuZgV1klLheUCo5ynp4FP35Zj2EpxRVJQAfRpTDi6myG7w3JNn51MqTLFPfnh
	 wdac20g8lTLSUjPxwCmZD7CQtRijt3WcBBiETSDJE4f41maAgeucEBT1IFzjLcQr6x
	 KeIgEayOFRii/pXgvj2J3i3jcx9/lrZYwLlqo/03Lp+YKKbwfxyUkgJHA6/eCQ1fD5
	 849kcCG7giSQotmykPgpASc+/lfbQNCloBaFITkZI0pmIu1agXk7hFNzKZLNhjSrkd
	 DReCWtzjFLzJQ==
Date: Wed, 22 Apr 2026 11:45:22 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
	si.yanteng@linux.dev, dzm91@hust.edu.cn,
	2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de,
	dsahern@kernel.org, jani.nikula@intel.com,
	mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
	pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
	mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de,
	sdf@fomichev.me, pkshih@realtek.com, enelsonmoore@gmail.com,
	mkl@pengutronix.de, toke@toke.dk, kees@kernel.org, crossd@gmail.com,
	jlayton@kernel.org, wangliang74@huawei.com, aha310510@gmail.com,
	takamitz@amazon.co.jp, kuniyu@google.com, linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260422104522.GK651125@horms.kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14228-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,vaga.pv.it,kernel.org,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,horms.kernel.org:mid]
X-Rspamd-Queue-Id: B7396444EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:18:23PM -0700, Jakub Kicinski wrote:
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

Reviewed-by: Simon Horman <horms@kernel.org>

