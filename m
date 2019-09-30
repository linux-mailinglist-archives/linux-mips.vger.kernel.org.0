Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A90BC1AB6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Sep 2019 06:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfI3E3T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 00:29:19 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:48580 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfI3E3T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Sep 2019 00:29:19 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23990422AbfI3E3QvLW9g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 06:29:16 +0200
Date:   Mon, 30 Sep 2019 05:29:16 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paul.burton@mips.com>
cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 3/3] MIPS: tlbex: Remove cpu_has_local_ebase
In-Reply-To: <20190831154027.6943-3-paul.burton@mips.com>
Message-ID: <alpine.LFD.2.21.1909300526270.17727@eddie.linux-mips.org>
References: <20190831154027.6943-1-paul.burton@mips.com> <20190831154027.6943-3-paul.burton@mips.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 31 Aug 2019, Paul Burton wrote:

> Remove cpu_has_local_ebase & simply generate the TLB refill handler once
> during boot, just like the rest of the TLB exception handlers.

 You may want to update this comment:

	/*
	 * The refill handler is generated per-CPU, multi-node systems
	 * may have local storage for it. The other handlers are only
	 * needed once.
	 */

accordingly then (assuming you've checked it no longer applies before 
making this change).

  Maciej
