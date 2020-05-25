Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CD31E12C4
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 18:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731488AbgEYQfN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 12:35:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:60842 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730014AbgEYQfN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 12:35:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5A3214A2;
        Mon, 25 May 2020 16:35:12 +0000 (UTC)
Date:   Mon, 25 May 2020 10:35:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     john mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, rdunlap@infradead.org
Subject: Re: [RFC PATCH v5 0/3] Add scheduler overview documentation
Message-ID: <20200525103511.6966206b@lwn.net>
In-Reply-To: <20200514092637.15684-1-John.Mathew@unikie.com>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 May 2020 12:26:34 +0300
john mathew <john.mathew@unikie.com> wrote:

> This patch series updates the scheduler documentation to add more topics
> wrt to scheduler overview. New sections are added to provide a brief
> overview of the kernel structs used by the scheduler, scheduler invocation,
> context switch and Capacity Aware Scheduling. Previous version of
> the patch was reviewed at:
> Link: https://lore.kernel.org/lkml/20200513134338.19688-2-John.Mathew@unikie.com/

Did we ever reach a conclusion on this series?  I don't see a lot of acks
there yet, so I'm a little leery about applying it...

Thanks,

jon
