Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CAB691E7F
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 12:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbjBJLjI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 06:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjBJLjF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 06:39:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D352A6D4;
        Fri, 10 Feb 2023 03:39:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4FFA7B824B5;
        Fri, 10 Feb 2023 11:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27A3C4339B;
        Fri, 10 Feb 2023 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676029141;
        bh=bXLxhCbm8PLSlv2BYgc9umLlpmECPGjRF/I+Yq6eOPU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gn8X1Mzt7l1dAv8XPucI5wpV2cSe+bBDTOedgeHXmuiVrmfXNjYqdixSpJ3jxJERT
         L/zK4N01Z5U/P+GDlKlxMcc18jk3HWI5VqDuqI9hc/gfwBxSZUJLR0ZSW/YE/dqCCq
         LssiToak5aDLMCfIc9+6YMCL7UbDi2MX+DsvU8dpbpg1RydjRwLfyOTpXPVwKNsX+8
         I5x4RggA4MzINOvLpbckFSjmMpDTcyNtT+ANQ/CnZavkYFG81GQ69e0j6memkBhhA2
         XuzfOYKC5Yd2EksaGGxcL8LfemWHGRefToaMIJqmX2xVlWCBvXrObHQGLULRnyfbUP
         G79bCxf02kZBA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pQRk2-009G8P-JZ;
        Fri, 10 Feb 2023 11:38:58 +0000
Date:   Fri, 10 Feb 2023 11:38:58 +0000
Message-ID: <86bkm1zr59.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v5 19/19] irqdomain: Switch to per-domain locking
In-Reply-To: <Y+YUs6lzalneLyz7@hovoldconsulting.com>
References: <20230209132323.4599-1-johan+linaro@kernel.org>
        <20230209132323.4599-20-johan+linaro@kernel.org>
        <86cz6izv48.wl-maz@kernel.org>
        <Y+YUs6lzalneLyz7@hovoldconsulting.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: johan@kernel.org, johan+linaro@kernel.org, tglx@linutronix.de, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, hsinyi@chromium.org, mark-pk.tsai@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 10 Feb 2023 09:56:03 +0000,
Johan Hovold <johan@kernel.org> wrote:
> 
> On Thu, Feb 09, 2023 at 04:00:55PM +0000, Marc Zyngier wrote:
> > On Thu, 09 Feb 2023 13:23:23 +0000,
> > Johan Hovold <johan+linaro@kernel.org> wrote:
> > > 
> > > The IRQ domain structures are currently protected by the global
> > > irq_domain_mutex. Switch to using more fine-grained per-domain locking,
> > > which can speed up parallel probing by reducing lock contention.
> > > 
> > > On a recent arm64 laptop, the total time spent waiting for the locks
> > > during boot drops from 160 to 40 ms on average, while the maximum
> > > aggregate wait time drops from 550 to 90 ms over ten runs for example.
> > > 
> > > Note that the domain lock of the root domain (innermost domain) must be
> > > used for hierarchical domains. For non-hierarchical domains (as for root
> > > domains), the new root pointer is set to the domain itself so that
> > > domain->root->mutex can be used in shared code paths.
> > > 
> > > Also note that hierarchical domains should be constructed using
> > > irq_domain_create_hierarchy() (or irq_domain_add_hierarchy()) to avoid
> > > poking at irqdomain internals. As a safeguard, the lockdep assertion in
> > > irq_domain_set_mapping() will catch any offenders that fail to set the
> > > root domain pointer.
> > > 
> > > Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  include/linux/irqdomain.h |  4 +++
> > >  kernel/irq/irqdomain.c    | 61 +++++++++++++++++++++++++--------------
> > >  2 files changed, 44 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> > > index 16399de00b48..cad47737a052 100644
> > > --- a/include/linux/irqdomain.h
> > > +++ b/include/linux/irqdomain.h
> > > @@ -125,6 +125,8 @@ struct irq_domain_chip_generic;
> > >   *		core code.
> > >   * @flags:	Per irq_domain flags
> > >   * @mapcount:	The number of mapped interrupts
> > > + * @mutex:	Domain lock, hierarhical domains use root domain's lock
> > 
> > nit: hierarchical
> > 
> > > + * @root:	Pointer to root domain, or containing structure if non-hierarchical
> 
> > > @@ -226,6 +226,17 @@ struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, unsigned int s
> > >  
> > >  	domain->revmap_size = size;
> > >  
> > > +	/*
> > > +	 * Hierarchical domains use the domain lock of the root domain
> > > +	 * (innermost domain).
> > > +	 *
> > > +	 * For non-hierarchical domains (as for root domains), the root
> > > +	 * pointer is set to the domain itself so that domain->root->mutex
> > > +	 * can be used in shared code paths.
> > > +	 */
> > > +	mutex_init(&domain->mutex);
> > > +	domain->root = domain;
> > > +
> > >  	irq_domain_check_hierarchy(domain);
> > >  
> > >  	mutex_lock(&irq_domain_mutex);
> 
> > > @@ -518,7 +529,11 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
> > >  				   irq_hw_number_t hwirq,
> > >  				   struct irq_data *irq_data)
> > >  {
> > > -	lockdep_assert_held(&irq_domain_mutex);
> > > +	/*
> > > +	 * This also makes sure that all domains point to the same root when
> > > +	 * called from irq_domain_insert_irq() for each domain in a hierarchy.
> > > +	 */
> > > +	lockdep_assert_held(&domain->root->mutex);
> > >  
> > >  	if (irq_domain_is_nomap(domain))
> > >  		return;
> > > @@ -540,7 +555,7 @@ static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
> > >  
> > >  	hwirq = irq_data->hwirq;
> > >  
> > > -	mutex_lock(&irq_domain_mutex);
> > > +	mutex_lock(&domain->mutex);
> > 
> > So you made that point about being able to uniformly using root>mutex,
> > which I think is a good invariant. Yet you hardly make use of it. Why?
> 
> I went back and forth over that a bit, but decided to only use
> domain->root->mutex in paths that can be called for hierarchical
> domains (i.e. the "shared code paths" mentioned above).
> 
> Using it in paths that are clearly only called for non-hierarchical
> domains where domain->root == domain felt a bit lazy.

My concern here is that as this code gets further refactored, it may
become much harder to reason about what is the correct level of
locking.

> The counter argument is of course that using domain->root->lock allows
> people to think less about the code they are changing, but that's not
> necessarily always a good thing.

Eventually, non-hierarchical domains should simply die and be replaced
with a single level hierarchy. Having a unified locking in place will
definitely make the required work clearer.

> Also note that the lockdep asserts in the revmap helpers would catch
> anyone using domain->mutex where they should not (i.e. using
> domain->mutex for an hierarchical domain).

Lockdep is great, but lockdep is a runtime thing. It doesn't help
reasoning about what gets locked when changing this code.

> > > @@ -1132,6 +1147,7 @@ struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
> > >  	else
> > >  		domain = irq_domain_create_tree(fwnode, ops, host_data);
> > >  	if (domain) {
> > > +		domain->root = parent->root;
> > >  		domain->parent = parent;
> > >  		domain->flags |= flags;
> > 
> > So we still have a bug here, as we have published a domain that we
> > keep updating. A parallel probing could find it in the interval and do
> > something completely wrong.
> 
> Indeed we do, even if device links should make this harder to hit these
> days.
> 
> > Splitting the work would help, as per the following patch.
> 
> Looks good to me. Do you want to submit that as a patch that I'll rebase
> on or should I submit it as part of a v6?

Just take it directly.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
