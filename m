Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21DF45D70
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2019 15:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfFNNEy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jun 2019 09:04:54 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:37893 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfFNNEy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jun 2019 09:04:54 -0400
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hblst-0004De-V0; Fri, 14 Jun 2019 15:04:48 +0200
Date:   Fri, 14 Jun 2019 15:04:47 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Kitt <steve@sk2.org>
cc:     x86@kernel.org, linux-alpha@vger.kernel.org,
        LAK <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Drop unused isa_page_to_bus
In-Reply-To: <20190613161155.16946-1-steve@sk2.org>
Message-ID: <alpine.DEB.2.21.1906141504230.1722@nanos.tec.linutronix.de>
References: <20190613161155.16946-1-steve@sk2.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 13 Jun 2019, Stephen Kitt wrote:

> isa_page_to_bus is deprecated and no longer used anywhere, this patch
> removes it entirely.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
