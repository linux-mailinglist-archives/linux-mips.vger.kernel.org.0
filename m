Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E627E181C54
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 16:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgCKPaj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 11:30:39 -0400
Received: from merlin.infradead.org ([205.233.59.134]:46988 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbgCKPaj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 11:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=QAk7P4CpHzNJ4DNRvfngpoE+tpFBC0yLjfetBeJO58E=; b=ZBAZWNwjLrRUnQ/1PO2ybiBKkZ
        gd/uj3TQFC23W1cEcUx6QLG7m5OOvO9bsd24+3Y2zEoiP8UnxY8HV8HAKty/Mbv/eWXPQgPQP/6RG
        qas6pDH3pL8uzddDOXLRdfFICErcDefus0St4H4Iho6t+HOSOABFWMNFiGSPMrSd9ZfHl0tmjmQH0
        W2MyGcfTjwXqHpGYeENRf0WqBYgxWODiWoaPD8zdnclUurCwX5OBp7ATp1qq6f06cjStmjJIVUhgp
        L/L7MLld3gg2wf3jbpXYBiuNNfGFU2kPilTq+Ejh8aBMwAjXQE5GhYu/m5XqkUHnyX3vRJU88w/Pj
        XlLxPl8g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jC3J6-00024s-60; Wed, 11 Mar 2020 15:30:04 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9588130066E;
        Wed, 11 Mar 2020 16:30:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8A24420225666; Wed, 11 Mar 2020 16:30:00 +0100 (CET)
Date:   Wed, 11 Mar 2020 16:30:00 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next 004/491] PERFORMANCE EVENTS SUBSYSTEM: Use
 fallthrough;
Message-ID: <20200311153000.GP12561@hirez.programming.kicks-ass.net>
References: <cover.1583896344.git.joe@perches.com>
 <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d22360c5c665fd7f480a209ae46807dfb07bbe.1583896348.git.joe@perches.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 10, 2020 at 09:51:18PM -0700, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>

The subject can use a little less screaming, but the actual patch is
fine.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
