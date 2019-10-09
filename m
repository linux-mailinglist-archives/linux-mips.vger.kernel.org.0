Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D21D107C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbfJINqZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:46:25 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:36538 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731180AbfJINqY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 09:46:24 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993463AbfJINqWU6nXj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 15:46:22 +0200
Date:   Wed, 9 Oct 2019 14:46:22 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paul.burton@mips.com>
cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
In-Reply-To: <20191007221951.1889661-1-paul.burton@mips.com>
Message-ID: <alpine.LFD.2.21.1910091440050.25653@eddie.linux-mips.org>
References: <20191007221951.1889661-1-paul.burton@mips.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 7 Oct 2019, Paul Burton wrote:

> CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND is not selected by any of our
> defconfigs, so remove it to simplify the messy command line logic in
> arch_mem_init() a little.

 That sounds like a poor argument for a functional regression to me.  I 
have the option enabled in several configs I have been using just to be 
able to temporarily override any built-in parameters with ones typed from 
the console monitor's prompt.  Is it my mistake that I haven't put it in a 
defconfig?

  Maciej
